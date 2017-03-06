namespace NadekoBot.Services.Database.Models
{
    public class CurrencyTransaction : DbEntity
    {
        public long Amount { get; set; }
        public string Reason { get; set; }
        public long UserId { get; set; }
    }
}
