using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using NadekoBot.Migrations;
using NadekoBot.Services.Database;

namespace NadekoBot.Services
{
    public class DbHandler
    {
        private static DbHandler _instance = null;
        public static DbHandler Instance = _instance ?? (_instance = new DbHandler());
        private readonly DbContextOptions<NadekoContext> options;

        private string connectionString { get; }

        static DbHandler() { }

        private DbHandler()
        {
            connectionString = NadekoBot.Credentials.Db.ConnectionString;
            var optionsBuilder = new DbContextOptionsBuilder<NadekoContext>();
            //optionsBuilder.UseSqlite(NadekoBot.Credentials.Db.ConnectionString);
            optionsBuilder.UseSqlServer(connectionString);
            options = optionsBuilder.Options;
            //switch (NadekoBot.Credentials.Db.Type.ToUpperInvariant())
            //{
            //    case "SQLITE":
            //        dbType = typeof(NadekoSqliteContext);
            //        break;
            //    //case "SQLSERVER":
            //    //    dbType = typeof(NadekoSqlServerContext);
            //    //    break;
            //    default:
            //        break;

            //}
        }


        public NadekoContext GetDbContext()
        {
            var context = new NadekoContext(options);
            context.Database.Migrate();
            context.EnsureSeedData();
            return context;
            
        }

        private IUnitOfWork GetUnitOfWork() =>
            new UnitOfWork(GetDbContext());

        public static IUnitOfWork UnitOfWork() =>
            DbHandler.Instance.GetUnitOfWork();
    }
}