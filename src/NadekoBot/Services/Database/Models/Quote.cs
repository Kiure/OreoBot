using System.ComponentModel.DataAnnotations;

namespace NadekoBot.Services.Database.Models
{
    public class Quote : DbEntity
    {
        public long GuildId { get; set; }
        [Required]
        public string Keyword { get; set; }
        [Required]
        public string AuthorName { get; set; }
        public long AuthorId { get; set; }
        [Required]
        public string Text { get; set; }
    }
}
