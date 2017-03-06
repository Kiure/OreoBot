namespace NadekoBot.Services.Database.Models
{
    public class Currency : DbEntity
    {
        public long UserId { get; set; }
        public long Amount { get; set; }
    }
}
