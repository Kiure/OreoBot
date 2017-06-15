using Discord;
using Discord.Commands;
using NadekoBot.Attributes;
using NadekoBot.Extensions;
using NadekoBot.Modules.Games.Trivia;
using NadekoBot.Services;
using NadekoBot.Services.Database.Models;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static NadekoBot.Services.Database.Models.BlacklistItem;

namespace NadekoBot.Modules.Permissions
{
    public partial class Permissions
    {
        public enum AddRemove
        {
            Add,
            Rem
        }

        [Group]
        public class BlacklistCommands : NadekoSubmodule
        {
            public static ConcurrentHashSet<long> BlacklistedUsers { get; set; }
            public static ConcurrentHashSet<long> BlacklistedGuilds { get; set; }
            public static ConcurrentHashSet<long> BlacklistedChannels { get; set; }

            static BlacklistCommands()
            {
                using (var uow = DbHandler.UnitOfWork())
                {
                    var blacklist = uow.BotConfig.GetOrCreate().Blacklist;
                    BlacklistedUsers = new ConcurrentHashSet<long>(blacklist.Where(bi => bi.Type == BlacklistType.User).Select(c => c.ItemId));
                    BlacklistedGuilds = new ConcurrentHashSet<long>( blacklist.Where(bi => bi.Type == BlacklistType.Server).Select(c => c.ItemId));
                    BlacklistedChannels = new ConcurrentHashSet<long>(blacklist.Where(bi => bi.Type == BlacklistType.Channel).Select(c => c.ItemId));
                }
            }

            [NadekoCommand, Usage, Description, Aliases]
            [OwnerOnly]
            public Task UserBlacklist(AddRemove action, ulong id)
                => Blacklist(action, id, BlacklistType.User);

            [NadekoCommand, Usage, Description, Aliases]
            [OwnerOnly]
            public Task UserBlacklist(AddRemove action, IUser usr)
                => Blacklist(action, usr.Id, BlacklistType.User);

            [NadekoCommand, Usage, Description, Aliases]
            [OwnerOnly]
            public Task ChannelBlacklist(AddRemove action, ulong id)
                => Blacklist(action, id, BlacklistType.Channel);

            [NadekoCommand, Usage, Description, Aliases]
            [OwnerOnly]
            public Task ServerBlacklist(AddRemove action, ulong id)
                => Blacklist(action, id, BlacklistType.Server);

            [NadekoCommand, Usage, Description, Aliases]
            [OwnerOnly]
            public Task ServerBlacklist(AddRemove action, IGuild guild)
                => Blacklist(action, guild.Id, BlacklistType.Server);

            private async Task Blacklist(AddRemove action, ulong id, BlacklistType type)
            {
                if(action == AddRemove.Add && NadekoBot.Credentials.OwnerIds.Contains(id))
                    return;

                using (var uow = DbHandler.UnitOfWork())
                {
                    if (action == AddRemove.Add)
                    {
                        var item = new BlacklistItem { ItemId = (long)id, Type = type };
                        uow.BotConfig.GetOrCreate().Blacklist.Add(item);
                        if (type == BlacklistType.Server)
                        {
                            BlacklistedGuilds.Add((long) id);
                        }
                        else if (type == BlacklistType.Channel)
                        {
                            BlacklistedChannels.Add((long) id);
                        }
                        else if (type == BlacklistType.User)
                        {
                            BlacklistedUsers.Add((long) id);
                        }                        
                    }
                    else
                    {
                        uow.BotConfig.GetOrCreate().Blacklist.RemoveWhere(bi => bi.ItemId == (long) id && bi.Type == type);
                        if (type == BlacklistType.Server)
                        {
                            BlacklistedGuilds.TryRemove((long) id);
                        }
                        else if (type == BlacklistType.Channel)
                        {
                            BlacklistedChannels.TryRemove((long) id);
                        }
                        else if (type == BlacklistType.User)
                        {
                            BlacklistedUsers.TryRemove((long) id);
                        }
                    }
                    await uow.CompleteAsync().ConfigureAwait(false);
                }
                if (action == AddRemove.Add)
                {
                    TriviaGame tg;
                    switch (type)
                    {
                        case BlacklistType.Server:
                            Games.Games.TriviaCommands.RunningTrivias.TryRemove(id, out tg);
                            if (tg != null)
                            {
                                await tg.StopGame().ConfigureAwait(false);
                            }
                            break;
                        case BlacklistType.Channel:
                            var item = Games.Games.TriviaCommands.RunningTrivias.FirstOrDefault(kvp => kvp.Value.Channel.Id == id);
                            Games.Games.TriviaCommands.RunningTrivias.TryRemove(item.Key, out tg);
                            if (tg != null)
                            {
                                await tg.StopGame().ConfigureAwait(false);
                            }
                            break;
                        case BlacklistType.User:
                            break;
                    }

                }

                if(action == AddRemove.Add)
                    await ReplyConfirmLocalized("blacklisted", Format.Code(type.ToString()), Format.Code(id.ToString())).ConfigureAwait(false);
                else
                    await ReplyConfirmLocalized("unblacklisted", Format.Code(type.ToString()), Format.Code(id.ToString())).ConfigureAwait(false);
            }
        }
    }
}
