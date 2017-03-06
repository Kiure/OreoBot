namespace NadekoBot.Services.Database.Models
{
    public class UserPokeTypes : DbEntity
    {
        public long UserId { get; set; }
        public string type { get; set; }
    }
}
