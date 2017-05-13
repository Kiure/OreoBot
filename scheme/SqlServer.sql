IF OBJECT_ID(N'__EFMigrationsHistory') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO
CREATE TABLE [BotConfig] (
    [Id] int NOT NULL IDENTITY,
    [BufferSize] bigint NOT NULL,
    [CurrencyGenerationChance] real NOT NULL,
    [CurrencyGenerationCooldown] int NOT NULL,
    [CurrencyName] nvarchar(max),
    [CurrencyPluralName] nvarchar(max),
    [CurrencySign] nvarchar(max),
    [DMHelpString] nvarchar(max),
    [ForwardMessages] bit NOT NULL,
    [ForwardToAllOwners] bit NOT NULL,
    [HelpString] nvarchar(max),
    [MigrationVersion] int NOT NULL,
    [RemindMessageFormat] nvarchar(max),
    [RotatingStatuses] bit NOT NULL,
    CONSTRAINT [PK_BotConfig] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [ClashOfClans] (
    [Id] int NOT NULL IDENTITY,
    [ChannelId] bigint NOT NULL,
    [EnemyClan] nvarchar(max),
    [GuildId] bigint NOT NULL,
    [Size] int NOT NULL,
    [StartedAt] datetime2 NOT NULL,
    [WarState] int NOT NULL,
    CONSTRAINT [PK_ClashOfClans] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [ConversionUnits] (
    [Id] int NOT NULL IDENTITY,
    [InternalTrigger] nvarchar(max),
    [Modifier] decimal(18, 2) NOT NULL,
    [UnitType] nvarchar(max),
    CONSTRAINT [PK_ConversionUnits] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [Currency] (
    [Id] int NOT NULL IDENTITY,
    [Amount] bigint NOT NULL,
    [UserId] bigint NOT NULL,
    CONSTRAINT [PK_Currency] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [CustomReactions] (
    [Id] int NOT NULL IDENTITY,
    [GuildId] bigint,
    [IsRegex] bit NOT NULL,
    [OwnerOnly] bit NOT NULL,
    [Response] nvarchar(max),
    [Trigger] nvarchar(max),
    CONSTRAINT [PK_CustomReactions] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [Donators] (
    [Id] int NOT NULL IDENTITY,
    [Amount] int NOT NULL,
    [Name] nvarchar(max),
    [UserId] bigint NOT NULL,
    CONSTRAINT [PK_Donators] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [LogSettings] (
    [Id] int NOT NULL IDENTITY,
    [ChannelCreated] bit NOT NULL,
    [ChannelDestroyed] bit NOT NULL,
    [ChannelId] bigint NOT NULL,
    [ChannelUpdated] bit NOT NULL,
    [IsLogging] bit NOT NULL,
    [LogUserPresence] bit NOT NULL,
    [LogVoicePresence] bit NOT NULL,
    [MessageDeleted] bit NOT NULL,
    [MessageUpdated] bit NOT NULL,
    [UserBanned] bit NOT NULL,
    [UserJoined] bit NOT NULL,
    [UserLeft] bit NOT NULL,
    [UserPresenceChannelId] bigint NOT NULL,
    [UserUnbanned] bit NOT NULL,
    [UserUpdated] bit NOT NULL,
    [VoicePresenceChannelId] bigint NOT NULL,
    CONSTRAINT [PK_LogSettings] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [MusicPlaylists] (
    [Id] int NOT NULL IDENTITY,
    [Author] nvarchar(max),
    [AuthorId] bigint NOT NULL,
    [Name] nvarchar(max),
    CONSTRAINT [PK_MusicPlaylists] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [Permission] (
    [Id] int NOT NULL IDENTITY,
    [NextId] int,
    [PrimaryTarget] int NOT NULL,
    [PrimaryTargetId] bigint NOT NULL,
    [SecondaryTarget] int NOT NULL,
    [SecondaryTargetName] nvarchar(max),
    [State] bit NOT NULL,
    CONSTRAINT [PK_Permission] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Permission_Permission_NextId] FOREIGN KEY ([NextId]) REFERENCES [Permission] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [Quotes] (
    [Id] int NOT NULL IDENTITY,
    [AuthorId] bigint NOT NULL,
    [AuthorName] nvarchar(max) NOT NULL,
    [GuildId] bigint NOT NULL,
    [Keyword] nvarchar(max) NOT NULL,
    [Text] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Quotes] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [Reminders] (
    [Id] int NOT NULL IDENTITY,
    [ChannelId] bigint NOT NULL,
    [IsPrivate] bit NOT NULL,
    [Message] nvarchar(max),
    [ServerId] bigint NOT NULL,
    [UserId] bigint NOT NULL,
    [When] datetime2 NOT NULL,
    CONSTRAINT [PK_Reminders] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [Repeaters] (
    [Id] int NOT NULL IDENTITY,
    [ChannelId] bigint NOT NULL,
    [GuildId] bigint NOT NULL,
    [Interval] time NOT NULL,
    [Message] nvarchar(max),
    CONSTRAINT [PK_Repeaters] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [SelfAssignableRoles] (
    [Id] int NOT NULL IDENTITY,
    [GuildId] bigint NOT NULL,
    [RoleId] bigint NOT NULL,
    CONSTRAINT [PK_SelfAssignableRoles] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [BlacklistItem] (
    [Id] int NOT NULL IDENTITY,
    [BotConfigId] int,
    [ItemId] bigint NOT NULL,
    [Type] int NOT NULL,
    CONSTRAINT [PK_BlacklistItem] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_BlacklistItem_BotConfig_BotConfigId] FOREIGN KEY ([BotConfigId]) REFERENCES [BotConfig] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [EightBallResponses] (
    [Id] int NOT NULL IDENTITY,
    [BotConfigId] int,
    [Text] nvarchar(max),
    CONSTRAINT [PK_EightBallResponses] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_EightBallResponses_BotConfig_BotConfigId] FOREIGN KEY ([BotConfigId]) REFERENCES [BotConfig] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [ModulePrefixes] (
    [Id] int NOT NULL IDENTITY,
    [BotConfigId] int,
    [ModuleName] nvarchar(max),
    [Prefix] nvarchar(max),
    CONSTRAINT [PK_ModulePrefixes] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ModulePrefixes_BotConfig_BotConfigId] FOREIGN KEY ([BotConfigId]) REFERENCES [BotConfig] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [PlayingStatus] (
    [Id] int NOT NULL IDENTITY,
    [BotConfigId] int,
    [Status] nvarchar(max),
    CONSTRAINT [PK_PlayingStatus] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PlayingStatus_BotConfig_BotConfigId] FOREIGN KEY ([BotConfigId]) REFERENCES [BotConfig] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [RaceAnimals] (
    [Id] int NOT NULL IDENTITY,
    [BotConfigId] int,
    [Icon] nvarchar(max),
    [Name] nvarchar(max),
    CONSTRAINT [PK_RaceAnimals] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_RaceAnimals_BotConfig_BotConfigId] FOREIGN KEY ([BotConfigId]) REFERENCES [BotConfig] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [ClashCallers] (
    [Id] int NOT NULL IDENTITY,
    [BaseDestroyed] bit NOT NULL,
    [CallUser] nvarchar(max),
    [ClashWarId] int NOT NULL,
    [Stars] int NOT NULL,
    [TimeAdded] datetime2 NOT NULL,
    CONSTRAINT [PK_ClashCallers] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ClashCallers_ClashOfClans_ClashWarId] FOREIGN KEY ([ClashWarId]) REFERENCES [ClashOfClans] ([Id]) ON DELETE CASCADE
);
GO
CREATE TABLE [IgnoredLogChannels] (
    [Id] int NOT NULL IDENTITY,
    [ChannelId] bigint NOT NULL,
    [LogSettingId] int,
    CONSTRAINT [PK_IgnoredLogChannels] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_IgnoredLogChannels_LogSettings_LogSettingId] FOREIGN KEY ([LogSettingId]) REFERENCES [LogSettings] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [IgnoredVoicePresenceCHannels] (
    [Id] int NOT NULL IDENTITY,
    [ChannelId] bigint NOT NULL,
    [LogSettingId] int,
    CONSTRAINT [PK_IgnoredVoicePresenceCHannels] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_IgnoredVoicePresenceCHannels_LogSettings_LogSettingId] FOREIGN KEY ([LogSettingId]) REFERENCES [LogSettings] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [PlaylistSong] (
    [Id] int NOT NULL IDENTITY,
    [MusicPlaylistId] int,
    [Provider] nvarchar(max),
    [ProviderType] int NOT NULL,
    [Query] nvarchar(max),
    [Title] nvarchar(max),
    [Uri] nvarchar(max),
    CONSTRAINT [PK_PlaylistSong] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PlaylistSong_MusicPlaylists_MusicPlaylistId] FOREIGN KEY ([MusicPlaylistId]) REFERENCES [MusicPlaylists] ([Id]) ON DELETE CASCADE
);
GO
CREATE TABLE [GuildConfigs] (
    [Id] int NOT NULL IDENTITY,
    [AutoAssignRoleId] bigint NOT NULL,
    [AutoDeleteByeMessages] bit NOT NULL,
    [AutoDeleteGreetMessages] bit NOT NULL,
    [AutoDeleteGreetMessagesTimer] int NOT NULL,
    [AutoDeleteSelfAssignedRoleMessages] bit NOT NULL,
    [ByeMessageChannelId] bigint NOT NULL,
    [ChannelByeMessageText] nvarchar(max),
    [ChannelGreetMessageText] nvarchar(max),
    [DefaultMusicVolume] real NOT NULL,
    [DeleteMessageOnCommand] bit NOT NULL,
    [DmGreetMessageText] nvarchar(max),
    [ExclusiveSelfAssignedRoles] bit NOT NULL,
    [FilterInvites] bit NOT NULL,
    [FilterWords] bit NOT NULL,
    [GreetMessageChannelId] bigint NOT NULL,
    [GuildId] bigint NOT NULL,
    [LogSettingId] int,
    [PermissionRole] nvarchar(max),
    [RootPermissionId] int,
    [SendChannelByeMessage] bit NOT NULL,
    [SendChannelGreetMessage] bit NOT NULL,
    [SendDmGreetMessage] bit NOT NULL,
    [VerbosePermissions] bit NOT NULL,
    [VoicePlusTextEnabled] bit NOT NULL,
    CONSTRAINT [PK_GuildConfigs] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_GuildConfigs_LogSettings_LogSettingId] FOREIGN KEY ([LogSettingId]) REFERENCES [LogSettings] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_GuildConfigs_Permission_RootPermissionId] FOREIGN KEY ([RootPermissionId]) REFERENCES [Permission] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [CommandCooldown] (
    [Id] int NOT NULL IDENTITY,
    [CommandName] nvarchar(max),
    [GuildConfigId] int,
    [Seconds] int NOT NULL,
    CONSTRAINT [PK_CommandCooldown] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CommandCooldown_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [FilterChannelId] (
    [Id] int NOT NULL IDENTITY,
    [ChannelId] bigint NOT NULL,
    [GuildConfigId] int,
    [GuildConfigId1] int,
    CONSTRAINT [PK_FilterChannelId] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_FilterChannelId_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_FilterChannelId_GuildConfigs_GuildConfigId1] FOREIGN KEY ([GuildConfigId1]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [FilteredWord] (
    [Id] int NOT NULL IDENTITY,
    [GuildConfigId] int,
    [Word] nvarchar(max),
    CONSTRAINT [PK_FilteredWord] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_FilteredWord_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [FollowedStream] (
    [Id] int NOT NULL IDENTITY,
    [ChannelId] bigint NOT NULL,
    [GuildConfigId] int,
    [GuildId] bigint NOT NULL,
    [Type] int NOT NULL,
    [Username] nvarchar(max),
    CONSTRAINT [PK_FollowedStream] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_FollowedStream_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [GCChannelId] (
    [Id] int NOT NULL IDENTITY,
    [ChannelId] bigint NOT NULL,
    [GuildConfigId] int,
    CONSTRAINT [PK_GCChannelId] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_GCChannelId_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_BlacklistItem_BotConfigId] ON [BlacklistItem] ([BotConfigId]);
GO
CREATE INDEX [IX_ClashCallers_ClashWarId] ON [ClashCallers] ([ClashWarId]);
GO
CREATE INDEX [IX_CommandCooldown_GuildConfigId] ON [CommandCooldown] ([GuildConfigId]);
GO
CREATE UNIQUE INDEX [IX_Currency_UserId] ON [Currency] ([UserId]) WHERE [UserId] IS NOT NULL;
GO
CREATE UNIQUE INDEX [IX_Donators_UserId] ON [Donators] ([UserId]) WHERE [UserId] IS NOT NULL;
GO
CREATE INDEX [IX_EightBallResponses_BotConfigId] ON [EightBallResponses] ([BotConfigId]);
GO
CREATE INDEX [IX_FilterChannelId_GuildConfigId] ON [FilterChannelId] ([GuildConfigId]);
GO
CREATE INDEX [IX_FilterChannelId_GuildConfigId1] ON [FilterChannelId] ([GuildConfigId1]);
GO
CREATE INDEX [IX_FilteredWord_GuildConfigId] ON [FilteredWord] ([GuildConfigId]);
GO
CREATE INDEX [IX_FollowedStream_GuildConfigId] ON [FollowedStream] ([GuildConfigId]);
GO
CREATE INDEX [IX_GCChannelId_GuildConfigId] ON [GCChannelId] ([GuildConfigId]);
GO
CREATE UNIQUE INDEX [IX_GuildConfigs_GuildId] ON [GuildConfigs] ([GuildId]) WHERE [GuildId] IS NOT NULL;
GO
CREATE INDEX [IX_GuildConfigs_LogSettingId] ON [GuildConfigs] ([LogSettingId]);
GO
CREATE INDEX [IX_GuildConfigs_RootPermissionId] ON [GuildConfigs] ([RootPermissionId]);
GO
CREATE INDEX [IX_IgnoredLogChannels_LogSettingId] ON [IgnoredLogChannels] ([LogSettingId]);
GO
CREATE INDEX [IX_IgnoredVoicePresenceCHannels_LogSettingId] ON [IgnoredVoicePresenceCHannels] ([LogSettingId]);
GO
CREATE INDEX [IX_ModulePrefixes_BotConfigId] ON [ModulePrefixes] ([BotConfigId]);
GO
CREATE UNIQUE INDEX [IX_Permission_NextId] ON [Permission] ([NextId]) WHERE [NextId] IS NOT NULL;
GO
CREATE INDEX [IX_PlayingStatus_BotConfigId] ON [PlayingStatus] ([BotConfigId]);
GO
CREATE INDEX [IX_PlaylistSong_MusicPlaylistId] ON [PlaylistSong] ([MusicPlaylistId]);
GO
CREATE INDEX [IX_RaceAnimals_BotConfigId] ON [RaceAnimals] ([BotConfigId]);
GO
CREATE UNIQUE INDEX [IX_Repeaters_ChannelId] ON [Repeaters] ([ChannelId]) WHERE [ChannelId] IS NOT NULL;
GO
CREATE UNIQUE INDEX [IX_SelfAssignableRoles_GuildId_RoleId] ON [SelfAssignableRoles] ([GuildId], [RoleId]) WHERE [GuildId] IS NOT NULL AND [RoleId] IS NOT NULL;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20161011200458_first', N'1.1.0-rtm-22752');
GO
CREATE TABLE [CurrencyTransactions] (
    [Id] int NOT NULL IDENTITY,
    [Amount] bigint NOT NULL,
    [Reason] nvarchar(max),
    [UserId] bigint NOT NULL,
    CONSTRAINT [PK_CurrencyTransactions] PRIMARY KEY ([Id])
);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20161015005020_CurrencyTransaction', N'1.1.0-rtm-22752');
GO
ALTER TABLE [ClashCallers] ADD [SequenceNumber] int;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20161015102407_coc', N'1.1.0-rtm-22752');
GO
ALTER TABLE [GuildConfigs] ADD [MuteRoleName] nvarchar(max);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20161019055137_MuteRoleName', N'1.1.0-rtm-22752');
GO
ALTER TABLE [GuildConfigs] ADD [CleverbotEnabled] bit NOT NULL DEFAULT 0;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20161107213222_Cleverbot', N'1.1.0-rtm-22752');
GO
ALTER TABLE [GuildConfigs] ADD [AutoDeleteByeMessagesTimer] int NOT NULL DEFAULT 0;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20161122100602_Greet and bye improved', N'1.1.0-rtm-22752');
GO
CREATE TABLE [PokeGame] (
    [Id] int NOT NULL IDENTITY,
    [UserId] bigint NOT NULL,
    [type] nvarchar(max),
    CONSTRAINT [PK_PokeGame] PRIMARY KEY ([Id])
);
GO
CREATE UNIQUE INDEX [IX_PokeGame_UserId] ON [PokeGame] ([UserId]) WHERE [UserId] IS NOT NULL;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20161127233843_PokeGame', N'1.1.0-rtm-22752');
GO
CREATE TABLE [MutedUserId] (
    [Id] int NOT NULL IDENTITY,
    [GuildConfigId] int,
    [UserId] bigint NOT NULL,
    CONSTRAINT [PK_MutedUserId] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_MutedUserId_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_MutedUserId_GuildConfigId] ON [MutedUserId] ([GuildConfigId]);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20161213025624_mutedusers', N'1.1.0-rtm-22752');
GO
ALTER TABLE [LogSettings] ADD [ChannelCreatedId] bigint;
GO
ALTER TABLE [LogSettings] ADD [ChannelDestroyedId] bigint;
GO
ALTER TABLE [LogSettings] ADD [ChannelUpdatedId] bigint;
GO
ALTER TABLE [LogSettings] ADD [LogOtherId] bigint;
GO
ALTER TABLE [LogSettings] ADD [LogUserPresenceId] bigint;
GO
ALTER TABLE [LogSettings] ADD [LogVoicePresenceId] bigint;
GO
ALTER TABLE [LogSettings] ADD [LogVoicePresenceTTSId] bigint;
GO
ALTER TABLE [LogSettings] ADD [MessageDeletedId] bigint;
GO
ALTER TABLE [LogSettings] ADD [MessageUpdatedId] bigint;
GO
ALTER TABLE [LogSettings] ADD [UserBannedId] bigint;
GO
ALTER TABLE [LogSettings] ADD [UserJoinedId] bigint;
GO
ALTER TABLE [LogSettings] ADD [UserLeftId] bigint;
GO
ALTER TABLE [LogSettings] ADD [UserMutedId] bigint;
GO
ALTER TABLE [LogSettings] ADD [UserUnbannedId] bigint;
GO
ALTER TABLE [LogSettings] ADD [UserUpdatedId] bigint;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20161224032833_logsettings', N'1.1.0-rtm-22752');
GO
DROP TABLE [Repeaters];
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170110111159_repeater-drop', N'1.1.0-rtm-22752');
GO
CREATE TABLE [GuildRepeater] (
    [Id] int NOT NULL IDENTITY,
    [ChannelId] bigint NOT NULL,
    [GuildConfigId] int,
    [GuildId] bigint NOT NULL,
    [Interval] time NOT NULL,
    [Message] nvarchar(max),
    CONSTRAINT [PK_GuildRepeater] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_GuildRepeater_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_GuildRepeater_GuildConfigId] ON [GuildRepeater] ([GuildConfigId]);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170110111302_repeater-new', N'1.1.0-rtm-22752');
GO
CREATE TABLE [AntiRaidSetting] (
    [Id] int NOT NULL IDENTITY,
    [Action] int NOT NULL,
    [GuildConfigId] int NOT NULL,
    [Seconds] int NOT NULL,
    [UserThreshold] int NOT NULL,
    CONSTRAINT [PK_AntiRaidSetting] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AntiRaidSetting_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [AntiSpamSetting] (
    [Id] int NOT NULL IDENTITY,
    [Action] int NOT NULL,
    [GuildConfigId] int NOT NULL,
    [MessageThreshold] int NOT NULL,
    CONSTRAINT [PK_AntiSpamSetting] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AntiSpamSetting_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [AntiSpamIgnore] (
    [Id] int NOT NULL IDENTITY,
    [AntiSpamSettingId] int,
    [ChannelId] bigint NOT NULL,
    CONSTRAINT [PK_AntiSpamIgnore] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AntiSpamIgnore_AntiSpamSetting_AntiSpamSettingId] FOREIGN KEY ([AntiSpamSettingId]) REFERENCES [AntiSpamSetting] ([Id]) ON DELETE NO ACTION
);
GO
CREATE UNIQUE INDEX [IX_AntiRaidSetting_GuildConfigId] ON [AntiRaidSetting] ([GuildConfigId]) WHERE [GuildConfigId] IS NOT NULL;
GO
CREATE INDEX [IX_AntiSpamIgnore_AntiSpamSettingId] ON [AntiSpamIgnore] ([AntiSpamSettingId]);
GO
CREATE UNIQUE INDEX [IX_AntiSpamSetting_GuildConfigId] ON [AntiSpamSetting] ([GuildConfigId]) WHERE [GuildConfigId] IS NOT NULL;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170110180534_protection', N'1.1.0-rtm-22752');
GO
ALTER TABLE [BotConfig] ADD [BetflipMultiplier] real NOT NULL DEFAULT 1.95E0;
GO
ALTER TABLE [BotConfig] ADD [Betroll100Multiplier] real NOT NULL DEFAULT 10E0;
GO
ALTER TABLE [BotConfig] ADD [Betroll67Multiplier] real NOT NULL DEFAULT 2E0;
GO
ALTER TABLE [BotConfig] ADD [Betroll91Multiplier] real NOT NULL DEFAULT 4E0;
GO
ALTER TABLE [BotConfig] ADD [CurrencyDropAmount] int NOT NULL DEFAULT 1;
GO
ALTER TABLE [BotConfig] ADD [MinimumBetAmount] int NOT NULL DEFAULT 2;
GO
ALTER TABLE [BotConfig] ADD [TriviaCurrencyReward] int NOT NULL DEFAULT 0;
GO
CREATE TABLE [CommandPrice] (
    [Id] int NOT NULL IDENTITY,
    [BotConfigId] int,
    [CommandName] nvarchar(max),
    [Price] int NOT NULL,
    CONSTRAINT [PK_CommandPrice] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CommandPrice_BotConfig_BotConfigId] FOREIGN KEY ([BotConfigId]) REFERENCES [BotConfig] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_CommandPrice_BotConfigId] ON [CommandPrice] ([BotConfigId]);
GO
CREATE UNIQUE INDEX [IX_CommandPrice_Price] ON [CommandPrice] ([Price]) WHERE [Price] IS NOT NULL;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170112185538_currency-modifications', N'1.1.0-rtm-22752');
GO
ALTER TABLE [BotConfig] ADD [ErrorColor] nvarchar(max) NOT NULL DEFAULT N'ee281f';
GO
ALTER TABLE [BotConfig] ADD [OkColor] nvarchar(max) NOT NULL DEFAULT N'71cd40';
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170118202307_ok-error-colors', N'1.1.0-rtm-22752');
GO
CREATE TABLE [DiscordUser] (
    [Id] int NOT NULL IDENTITY,
    [AvatarId] nvarchar(max),
    [Discriminator] nvarchar(max),
    [UserId] bigint NOT NULL,
    [Username] nvarchar(max),
    CONSTRAINT [PK_DiscordUser] PRIMARY KEY ([Id]),
    CONSTRAINT [AK_DiscordUser_UserId] UNIQUE ([UserId])
);
GO
CREATE TABLE [WaifuInfo] (
    [Id] int NOT NULL IDENTITY,
    [AffinityId] int,
    [ClaimerId] int,
    [Price] int NOT NULL,
    [WaifuId] int NOT NULL,
    CONSTRAINT [PK_WaifuInfo] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_WaifuInfo_DiscordUser_AffinityId] FOREIGN KEY ([AffinityId]) REFERENCES [DiscordUser] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_WaifuInfo_DiscordUser_ClaimerId] FOREIGN KEY ([ClaimerId]) REFERENCES [DiscordUser] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_WaifuInfo_DiscordUser_WaifuId] FOREIGN KEY ([WaifuId]) REFERENCES [DiscordUser] ([Id]) ON DELETE CASCADE
);
GO
CREATE TABLE [WaifuUpdates] (
    [Id] int NOT NULL IDENTITY,
    [NewId] int,
    [OldId] int,
    [UpdateType] int NOT NULL,
    [UserId] int NOT NULL,
    CONSTRAINT [PK_WaifuUpdates] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_WaifuUpdates_DiscordUser_NewId] FOREIGN KEY ([NewId]) REFERENCES [DiscordUser] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_WaifuUpdates_DiscordUser_OldId] FOREIGN KEY ([OldId]) REFERENCES [DiscordUser] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_WaifuUpdates_DiscordUser_UserId] FOREIGN KEY ([UserId]) REFERENCES [DiscordUser] ([Id]) ON DELETE CASCADE
);
GO
CREATE INDEX [IX_WaifuInfo_AffinityId] ON [WaifuInfo] ([AffinityId]);
GO
CREATE INDEX [IX_WaifuInfo_ClaimerId] ON [WaifuInfo] ([ClaimerId]);
GO
CREATE UNIQUE INDEX [IX_WaifuInfo_WaifuId] ON [WaifuInfo] ([WaifuId]) WHERE [WaifuId] IS NOT NULL;
GO
CREATE INDEX [IX_WaifuUpdates_NewId] ON [WaifuUpdates] ([NewId]);
GO
CREATE INDEX [IX_WaifuUpdates_OldId] ON [WaifuUpdates] ([OldId]);
GO
CREATE INDEX [IX_WaifuUpdates_UserId] ON [WaifuUpdates] ([UserId]);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170122044958_waifus', N'1.1.0-rtm-22752');
GO
ALTER TABLE [GuildConfigs] ADD [Locale] nvarchar(max);
GO
ALTER TABLE [GuildConfigs] ADD [TimeZoneId] nvarchar(max);
GO
ALTER TABLE [BotConfig] ADD [Locale] nvarchar(max);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170213164350_guild-timezone-and-locale', N'1.1.0-rtm-22752');
GO
ALTER TABLE [WaifuUpdates] ADD [DateAdded] datetime2;
GO
ALTER TABLE [WaifuInfo] ADD [DateAdded] datetime2;
GO
ALTER TABLE [PokeGame] ADD [DateAdded] datetime2;
GO
ALTER TABLE [SelfAssignableRoles] ADD [DateAdded] datetime2;
GO
ALTER TABLE [Reminders] ADD [DateAdded] datetime2;
GO
ALTER TABLE [RaceAnimals] ADD [DateAdded] datetime2;
GO
ALTER TABLE [Quotes] ADD [DateAdded] datetime2;
GO
ALTER TABLE [PlaylistSong] ADD [DateAdded] datetime2;
GO
ALTER TABLE [PlayingStatus] ADD [DateAdded] datetime2;
GO
ALTER TABLE [Permission] ADD [DateAdded] datetime2;
GO
ALTER TABLE [MutedUserId] ADD [DateAdded] datetime2;
GO
ALTER TABLE [MusicPlaylists] ADD [DateAdded] datetime2;
GO
ALTER TABLE [ModulePrefixes] ADD [DateAdded] datetime2;
GO
ALTER TABLE [LogSettings] ADD [DateAdded] datetime2;
GO
ALTER TABLE [IgnoredVoicePresenceCHannels] ADD [DateAdded] datetime2;
GO
ALTER TABLE [IgnoredLogChannels] ADD [DateAdded] datetime2;
GO
ALTER TABLE [GuildRepeater] ADD [DateAdded] datetime2;
GO
ALTER TABLE [GuildConfigs] ADD [DateAdded] datetime2;
GO
ALTER TABLE [GCChannelId] ADD [DateAdded] datetime2;
GO
ALTER TABLE [FollowedStream] ADD [DateAdded] datetime2;
GO
ALTER TABLE [FilteredWord] ADD [DateAdded] datetime2;
GO
ALTER TABLE [FilterChannelId] ADD [DateAdded] datetime2;
GO
ALTER TABLE [EightBallResponses] ADD [DateAdded] datetime2;
GO
ALTER TABLE [Donators] ADD [DateAdded] datetime2;
GO
ALTER TABLE [DiscordUser] ADD [DateAdded] datetime2;
GO
ALTER TABLE [CustomReactions] ADD [DateAdded] datetime2;
GO
ALTER TABLE [CurrencyTransactions] ADD [DateAdded] datetime2;
GO
ALTER TABLE [Currency] ADD [DateAdded] datetime2;
GO
ALTER TABLE [ConversionUnits] ADD [DateAdded] datetime2;
GO
ALTER TABLE [CommandPrice] ADD [DateAdded] datetime2;
GO
ALTER TABLE [CommandCooldown] ADD [DateAdded] datetime2;
GO
ALTER TABLE [ClashOfClans] ADD [DateAdded] datetime2;
GO
ALTER TABLE [ClashCallers] ADD [DateAdded] datetime2;
GO
ALTER TABLE [BotConfig] ADD [DateAdded] datetime2;
GO
ALTER TABLE [BlacklistItem] ADD [DateAdded] datetime2;
GO
ALTER TABLE [AntiSpamSetting] ADD [DateAdded] datetime2;
GO
ALTER TABLE [AntiSpamIgnore] ADD [DateAdded] datetime2;
GO
ALTER TABLE [AntiRaidSetting] ADD [DateAdded] datetime2;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170222162505_dateadded', N'1.1.0-rtm-22752');
GO
CREATE TABLE [Permissionv2] (
    [Id] int NOT NULL IDENTITY,
    [DateAdded] datetime2,
    [GuildConfigId] int,
    [Index] int NOT NULL,
    [PrimaryTarget] int NOT NULL,
    [PrimaryTargetId] bigint NOT NULL,
    [SecondaryTarget] int NOT NULL,
    [SecondaryTargetName] nvarchar(max),
    [State] bit NOT NULL,
    CONSTRAINT [PK_Permissionv2] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Permissionv2_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_Permissionv2_GuildConfigId] ON [Permissionv2] ([GuildConfigId]);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170308033058_permsv2', N'1.1.0-rtm-22752');
GO
CREATE TABLE [UnmuteTimer] (
    [Id] int NOT NULL IDENTITY,
    [DateAdded] datetime2,
    [GuildConfigId] int,
    [UnmuteAt] datetime2 NOT NULL,
    [UserId] bigint NOT NULL,
    CONSTRAINT [PK_UnmuteTimer] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_UnmuteTimer_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_UnmuteTimer_GuildConfigId] ON [UnmuteTimer] ([GuildConfigId]);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170310210952_unmute-timers', N'1.1.0-rtm-22752');
GO
CREATE TABLE [VcRoleInfo] (
    [Id] int NOT NULL IDENTITY,
    [DateAdded] datetime2,
    [GuildConfigId] int,
    [RoleId] bigint NOT NULL,
    [VoiceChannelId] bigint NOT NULL,
    CONSTRAINT [PK_VcRoleInfo] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_VcRoleInfo_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_VcRoleInfo_GuildConfigId] ON [VcRoleInfo] ([GuildConfigId]);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170311054632_vcrole', N'1.1.0-rtm-22752');
GO
ALTER TABLE [CustomReactions] ADD [AutoDeleteTrigger] bit NOT NULL DEFAULT 0;
GO
ALTER TABLE [CustomReactions] ADD [DmResponse] bit NOT NULL DEFAULT 0;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170318190018_crad-and-crdm', N'1.1.0-rtm-22752');
GO
CREATE TABLE [CommandAlias] (
    [Id] int NOT NULL IDENTITY,
    [DateAdded] datetime2,
    [GuildConfigId] int,
    [Mapping] nvarchar(max),
    [Trigger] nvarchar(max),
    CONSTRAINT [PK_CommandAlias] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CommandAlias_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_CommandAlias_GuildConfigId] ON [CommandAlias] ([GuildConfigId]);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170320090138_command-aliasing', N'1.1.0-rtm-22752');
GO
ALTER TABLE [GuildConfigs] ADD [WarningsInitialized] bit NOT NULL DEFAULT 0;
GO
CREATE TABLE [Warnings] (
    [Id] int NOT NULL IDENTITY,
    [DateAdded] datetime2,
    [Forgiven] bit NOT NULL,
    [ForgivenBy] nvarchar(max),
    [GuildId] bigint NOT NULL,
    [Moderator] nvarchar(max),
    [Reason] nvarchar(max),
    [UserId] bigint NOT NULL,
    CONSTRAINT [PK_Warnings] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [WarningPunishment] (
    [Id] int NOT NULL IDENTITY,
    [Count] int NOT NULL,
    [DateAdded] datetime2,
    [GuildConfigId] int,
    [Punishment] int NOT NULL,
    [Time] int NOT NULL,
    CONSTRAINT [PK_WarningPunishment] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_WarningPunishment_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_WarningPunishment_GuildConfigId] ON [WarningPunishment] ([GuildConfigId]);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170330000613_warning-commands', N'1.1.0-rtm-22752');
GO
CREATE TABLE [StartupCommand] (
    [Id] int NOT NULL IDENTITY,
    [BotConfigId] int,
    [ChannelId] bigint NOT NULL,
    [ChannelName] nvarchar(max),
    [CommandText] nvarchar(max),
    [DateAdded] datetime2,
    [GuildId] bigint,
    [GuildName] nvarchar(max),
    [Index] int NOT NULL,
    [VoiceChannelId] bigint,
    [VoiceChannelName] nvarchar(max),
    CONSTRAINT [PK_StartupCommand] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_StartupCommand_BotConfig_BotConfigId] FOREIGN KEY ([BotConfigId]) REFERENCES [BotConfig] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_StartupCommand_BotConfigId] ON [StartupCommand] ([BotConfigId]);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170331093025_startup-commands', N'1.1.0-rtm-22752');
GO
CREATE TABLE [SlowmodeIgnoredRole] (
    [Id] int NOT NULL IDENTITY,
    [DateAdded] datetime2,
    [GuildConfigId] int,
    [RoleId] bigint NOT NULL,
    CONSTRAINT [PK_SlowmodeIgnoredRole] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_SlowmodeIgnoredRole_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [SlowmodeIgnoredUser] (
    [Id] int NOT NULL IDENTITY,
    [DateAdded] datetime2,
    [GuildConfigId] int,
    [UserId] bigint NOT NULL,
    CONSTRAINT [PK_SlowmodeIgnoredUser] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_SlowmodeIgnoredUser_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_SlowmodeIgnoredRole_GuildConfigId] ON [SlowmodeIgnoredRole] ([GuildConfigId]);
GO
CREATE INDEX [IX_SlowmodeIgnoredUser_GuildConfigId] ON [SlowmodeIgnoredUser] ([GuildConfigId]);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170401161600_slowmode-whitelist', N'1.1.0-rtm-22752');
GO
CREATE TABLE [RewardedUsers] (
    [Id] int NOT NULL IDENTITY,
    [AmountRewardedThisMonth] int NOT NULL,
    [DateAdded] datetime2,
    [LastReward] datetime2 NOT NULL,
    [UserId] bigint NOT NULL,
    CONSTRAINT [PK_RewardedUsers] PRIMARY KEY ([Id])
);
GO
CREATE UNIQUE INDEX [IX_RewardedUsers_UserId] ON [RewardedUsers] ([UserId]) WHERE [UserId] IS NOT NULL;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170401205753_patreon-rewards', N'1.1.0-rtm-22752');
GO
CREATE TABLE [ShopEntry] (
    [Id] int NOT NULL IDENTITY,
    [AuthorId] bigint NOT NULL,
    [DateAdded] datetime2,
    [GuildConfigId] int,
    [Index] int NOT NULL,
    [Name] nvarchar(max),
    [Price] int NOT NULL,
    [RoleId] bigint NOT NULL,
    [RoleName] nvarchar(max),
    [Type] int NOT NULL,
    CONSTRAINT [PK_ShopEntry] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ShopEntry_GuildConfigs_GuildConfigId] FOREIGN KEY ([GuildConfigId]) REFERENCES [GuildConfigs] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [ShopEntryItem] (
    [Id] int NOT NULL IDENTITY,
    [DateAdded] datetime2,
    [ShopEntryId] int,
    [Text] nvarchar(max),
    CONSTRAINT [PK_ShopEntryItem] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ShopEntryItem_ShopEntry_ShopEntryId] FOREIGN KEY ([ShopEntryId]) REFERENCES [ShopEntry] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_ShopEntry_GuildConfigId] ON [ShopEntry] ([GuildConfigId]);
GO
CREATE INDEX [IX_ShopEntryItem_ShopEntryId] ON [ShopEntryItem] ([ShopEntryId]);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170405161814_flower-shop', N'1.1.0-rtm-22752');
GO
ALTER TABLE [GuildConfigs] ADD [GameVoiceChannel] bigint;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170408162851_game-voice-channel', N'1.1.0-rtm-22752');
GO
CREATE TABLE [BlockedCmdOrMdl] (
    [Id] int NOT NULL IDENTITY,
    [BotConfigId] int,
    [BotConfigId1] int,
    [DateAdded] datetime2,
    [Name] nvarchar(max),
    CONSTRAINT [PK_BlockedCmdOrMdl] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_BlockedCmdOrMdl_BotConfig_BotConfigId] FOREIGN KEY ([BotConfigId]) REFERENCES [BotConfig] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_BlockedCmdOrMdl_BotConfig_BotConfigId1] FOREIGN KEY ([BotConfigId1]) REFERENCES [BotConfig] ([Id]) ON DELETE NO ACTION
);
GO
CREATE INDEX [IX_BlockedCmdOrMdl_BotConfigId] ON [BlockedCmdOrMdl] ([BotConfigId]);
GO
CREATE INDEX [IX_BlockedCmdOrMdl_BotConfigId1] ON [BlockedCmdOrMdl] ([BotConfigId1]);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170409193757_gmod-and-cmod', N'1.1.0-rtm-22752');
GO
ALTER TABLE [RewardedUsers] ADD [PatreonUserId] nvarchar(max);
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170501103455_patreon-id', N'1.1.0-rtm-22752');
GO
