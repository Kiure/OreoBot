using System;

namespace NadekoBot.Services.Database.Models
{
    public class Repeater : DbEntity
    {
        public long GuildId { get; set; }
        public long ChannelId { get; set; }
        public string Message { get; set; }
        public TimeSpan Interval { get; set; }
    }

    public class GuildRepeater : Repeater
    {

    }
}
