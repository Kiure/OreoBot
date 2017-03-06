namespace NadekoBot.Services.Database.Models
{
    public class SelfAssignedRole : DbEntity
    {
        public long GuildId { get; set; }
        public long RoleId { get; set; }
    }
}
