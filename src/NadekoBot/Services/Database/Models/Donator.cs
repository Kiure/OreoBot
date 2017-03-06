namespace NadekoBot.Services.Database.Models
{
    public class Donator : DbEntity
    {
        public long UserId { get; set; }
        public string Name { get; set; }
        public int Amount { get; set; } = 0;
    }
}
