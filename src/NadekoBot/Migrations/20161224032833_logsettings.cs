using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

namespace NadekoBot.Migrations
{
    public partial class logsettings : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<long>(
                name: "ChannelCreatedId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "ChannelDestroyedId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "ChannelUpdatedId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "LogOtherId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "LogUserPresenceId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "LogVoicePresenceId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "LogVoicePresenceTTSId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "MessageDeletedId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "MessageUpdatedId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "UserBannedId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "UserJoinedId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "UserLeftId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "UserMutedId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "UserUnbannedId",
                table: "LogSettings",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "UserUpdatedId",
                table: "LogSettings",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ChannelCreatedId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "ChannelDestroyedId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "ChannelUpdatedId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "LogOtherId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "LogUserPresenceId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "LogVoicePresenceId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "LogVoicePresenceTTSId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "MessageDeletedId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "MessageUpdatedId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "UserBannedId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "UserJoinedId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "UserLeftId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "UserMutedId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "UserUnbannedId",
                table: "LogSettings");

            migrationBuilder.DropColumn(
                name: "UserUpdatedId",
                table: "LogSettings");
        }
    }
}
