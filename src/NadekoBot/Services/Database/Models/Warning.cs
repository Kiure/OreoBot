namespace NadekoBot.Services.Database.Models
{
    public class Warning : DbEntity
    {
        public long GuildId { get; set; }
        public long UserId { get; set; }
        public string Reason { get; set; }
        public bool Forgiven { get; set; }
        public string ForgivenBy { get; set; }
        public string Moderator { get; set; }
    }
}
