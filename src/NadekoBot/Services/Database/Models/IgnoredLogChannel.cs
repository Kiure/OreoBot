namespace NadekoBot.Services.Database.Models
{
    public class IgnoredLogChannel : DbEntity
    {
        public LogSetting LogSetting { get; set; }
        public long ChannelId { get; set; }
    }
}
