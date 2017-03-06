using System.Collections.Generic;

namespace NadekoBot.Services.Database.Models
{

    public class LogSetting : DbEntity
    {
        public HashSet<IgnoredLogChannel> IgnoredChannels { get; set; } = new HashSet<IgnoredLogChannel>();
        public HashSet<IgnoredVoicePresenceChannel> IgnoredVoicePresenceChannelIds { get; set; } = new HashSet<IgnoredVoicePresenceChannel>();

        public long? LogOtherId { get; set; } = null;
        public long? MessageUpdatedId { get; set; } = null;
        public long? MessageDeletedId { get; set; } = null;

        public long? UserJoinedId { get; set; } = null;
        public long? UserLeftId { get; set; } = null;
        public long? UserBannedId { get; set; } = null;
        public long? UserUnbannedId { get; set; } = null;
        public long? UserUpdatedId { get; set; } = null;

        public long? ChannelCreatedId { get; set; } = null;
        public long? ChannelDestroyedId { get; set; } = null;
        public long? ChannelUpdatedId { get; set; } = null;

        public long? UserMutedId { get; set; }

        //userpresence
        public long? LogUserPresenceId { get; set; } = null;

        //voicepresence

        public long? LogVoicePresenceId { get; set; } = null;
        public long? LogVoicePresenceTTSId { get; set; } = null;



        //-------------------DO NOT USE----------------
        // these old fields are here because sqlite doesn't support drop column operation
        // will be removed after bot moves to another database provider
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool IsLogging { get; set; }
        /// <summary>
        /// DON'T USE
        /// </summary>
        public long ChannelId { get; set; }
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool MessageUpdated { get; set; } = true;
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool MessageDeleted { get; set; } = true;
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool UserJoined { get; set; } = true;
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool UserLeft { get; set; } = true;
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool UserBanned { get; set; } = true;
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool UserUnbanned { get; set; } = true;
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool UserUpdated { get; set; } = true;
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool ChannelCreated { get; set; } = true;
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool ChannelDestroyed { get; set; } = true;
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool ChannelUpdated { get; set; } = true;
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool LogUserPresence { get; set; } = false;
        /// <summary>
        /// DON'T USE
        /// </summary>
        public long UserPresenceChannelId { get; set; }
        /// <summary>
        /// DON'T USE
        /// </summary>
        public bool LogVoicePresence { get; set; } = false;
        /// <summary>
        /// DON'T USE
        /// </summary>
        public long VoicePresenceChannelId { get; set; }
    }
}