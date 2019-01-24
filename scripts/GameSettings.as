package
{
   import fl.lang.Locale;
   
   public class GameSettings
   {
      
      public static const §_-PP§:int = 0;
      
      public static const MEDIUM:int = 1;
      
      public static const §_-d§:int = 2;
      
      public static const §_-U§:int = 0;
      
      public static const §_-5d§:int = 1;
      
      public static const §_-Ko§:int = 2;
      
      public static const §_-5z§:int = 3;
      
      public static const §_-OS§:int = 0;
      
      public static const §_-R6§:int = 1;
      
      public static const §_-AQ§:int = 2;
      
      public static const DIFFICULTY_NORMAL:int = 0;
      
      public static const DIFFICULTY_EASY:int = 1;
      
      public static const DIFFICULTY_NONE:int = 2;
      
      public static const DIFFICULTY_HARD:int = 3;
      
      public static const §_-8-§:int = 0;
      
      public static const §_-1§:int = 1;
      
      public static const §_-TL§:int = 2;
      
      public static const §_-Oh§:int = 3;
      
      public static const §_-PW§:int = 1;
      
      public static const §_-6P§:int = 2;
      
      public static const §_-99§:int = 3;
      
      public static const §_-Od§:int = 4;
      
      public static const §_-7H§:int = 5;
      
      public static const §_-98§:int = 6;
      
      public static const HERO_DENAS:int = 7;
      
      public static const §_-Mu§:String = "NotificationTowerMage";
      
      public static const §_-5b§:String = "NotificationTowerEngineer";
      
      public static const NOTIFICATION_TOWER_LEVEL2:String = "NotificationTowerLevel2";
      
      public static const §_-C2§:String = "NotificationPowerFireball";
      
      public static const §_-Dm§:String = "NotificationPowerReinforcement";
      
      public static const NOTIFICATION_TOWER_LEVEL3:String = "NotificationTowerLevel3";
      
      public static const §_-KZ§:String = "NotificationTowerArcherRanger";
      
      public static const §_-Gi§:String = "NotificationTowerSoldierPaladin";
      
      public static const §_-Jz§:String = "NotificationTowerMageArcane";
      
      public static const §_-KO§:String = "NotificationTowerMageSorcerer";
      
      public static const §_-Ld§:String = "NotificationTowerSoldierBarbarian";
      
      public static const §_-HX§:String = "NotificationTowerArcherMusketeer";
      
      public static const §_-Dg§:String = "NotificationTowerEngineerTesla";
      
      public static const §_-1Y§:String = "NotificationEnemyGoblin";
      
      public static const §_-To§:String = "NotificationEnemyFatOrc";
      
      public static const final:String = "NotificationEnemyOgre";
      
      public static const §_-4Q§:String = "NotificationEnemyWolfSmall";
      
      public static const §_-Oa§:String = "NotificationEnemyShaman";
      
      public static const §_-ER§:String = "NotificationEnemyBandit";
      
      public static const §_-7D§:String = "NotificationEnemyBrigand";
      
      public static const §_-2X§:String = "NotificationEnemyDarkKnight";
      
      public static const §_-A§:String = "NotificationEnemyGargoyle";
      
      public static const §with§:String = "NotificationEnemyMarauder";
      
      public static const §_-Bb§:String = "NotificationEnemyWolf";
      
      public static const §_-N8§:String = "NotificationEnemyShadowArcher";
      
      public static const §_-Bd§:String = "NotificationEnemySpider";
      
      public static const §_-DG§:String = "NotificationEnemySpiderSmall";
      
      public static const §_-ND§:String = "NotificationEnemyTroll";
      
      public static const § for§:String = "NotificationEnemyTrollAxeThrower";
      
      public static const §_-Cs§:String = "NotificationEnemyTrollChieftain";
      
      public static const NOTIFICATION_ENEMY_WHITE_WOLF:String = "NotificationEnemyWhiteWolf";
      
      public static const NOTIFICATION_ENEMY_YETI:String = "NotificationEnemyYeti";
      
      public static const §_-MT§:String = "NotificationEnemySlayer";
      
      public static const §_-BG§:String = "NotificationEnemyRocketeer";
      
      public static const §_-L7§:String = "NotificationEnemyDemon";
      
      public static const §_-QE§:String = "NotificationEnemyDemonMage";
      
      public static const NOTIFICATION_ENEMY_DEMON_WOLF:String = "NotificationEnemyDemonWolf";
      
      public static const §_-G4§:String = "NotificationEnemyDemonImp";
      
      public static const §_-FQ§:String = "NotificationEnemyNecromancer";
      
      public static const §_-PT§:String = "NotificationEnemyLavaElemental";
      
      public static const §_-BS§:String = "NotificationEnemySarelgazSmall";
      
      public static const §_-N3§:String = "NotificationEnemyOrcArmored";
      
      public static const §_-MW§:String = "NotificationEnemyOrcWolfRider";
      
      public static const §_-O§:String = "NotificationEnemyGoblinZapper";
      
      public static const §_-Ec§:String = "NotificationEnemyForestTroll";
      
      public static const §_-PQ§:String = "NotificationEnemyZombie";
      
      public static const §_-It§:String = "NotificationEnemyRottenSpider";
      
      public static const §_-DY§:String = "NotificationEnemyRottenTree";
      
      public static const §_-2m§:String = "NotificationEnemyThing";
      
      public static const §_-70§:String = "NotificationEnemyRaider";
      
      public static const §_-4M§:String = "NotificationEnemyPillager";
      
      public static const §_-Ag§:String = "NotificationTipRallyPoint";
      
      public static const §_-K2§:String = "NotificationTipArmor";
      
      public static const §_-1S§:String = "NotificationTipArmorMagic";
      
      public static const §_-GN§:String = "NotificationTipStrategySoldier";
      
      public static const §_-LT§:String = "NotificationTipStrategyHeavyArmor";
      
      public static const §_-4F§:String = "NotificationTipHeroes";
       
      
      private var game:Game;
      
      private var maxUpgradeLevel:int;
      
      public const §_-Fu§:Number = 0.3;
      
      public const §_-8x§:int = 15;
      
      public const framesRate:int = 30;
      
      public const rangeRatio:Number = 0.7;
      
      public const sellPercent:Number = 0.6;
      
      public const §_-0P§:Number = 2;
      
      public const §_-6e§:Number = 2;
      
      public const enemyMaxLevel:int = 99;
      
      public const buildingTime:int = 30;
      
      private var §_-26§:Number;
      
      private var §_-Nx§:Number;
      
      public var mages;
      
      public var archers;
      
      public var engineers;
      
      public var soldiers;
      
      public var powers;
      
      public var enemies;
      
      public var specials;
      
      public var heroes;
      
      public const P_ARMOR:int = 0;
      
      public const M_ARMOR:int = 1;
      
      public const E_ARMOR:int = 2;
      
      public const I_ARMOR:int = 3;
      
      public function GameSettings(param1:Game, param2:Boolean = true, param3:int = 0)
      {
         this.mages = new Object();
         this.archers = new Object();
         this.engineers = new Object();
         this.soldiers = new Object();
         this.powers = new Object();
         this.enemies = new Object();
         this.specials = new Object();
         this.heroes = new Object();
         super();
         this.game = param1;
         if(this.game.difficulty == DIFFICULTY_EASY)
         {
            this.§_-26§ = 0.8;
            this.§_-Nx§ = 1.2;
         }
         else if(this.game.difficulty == DIFFICULTY_NORMAL || this.game.difficulty == DIFFICULTY_NONE)
         {
            this.§_-26§ = 1;
            this.§_-Nx§ = 1;
         }
         else if(this.game.difficulty == DIFFICULTY_HARD)
         {
            this.§_-26§ = 1.2;
            this.§_-Nx§ = 1;
         }
         this.maxUpgradeLevel = param3;
         this.§_-G8§();
         this.§_-M§();
         this.§_-4h§();
         this.§_-1i§();
         this.§_-Pe§();
         this.§_-9T§();
         this.§_-B2§();
         this.§_-Qc§();
         if(param2)
         {
            this.§_-q§();
         }
      }
      
      public function getEnemieName(param1:String) : Object
      {
         switch(param1)
         {
            case "EnemyGoblin":
               return Locale.loadStringEx("ENEMY_GOBLIN_NAME",Locale.getDefaultLang());
            case "EnemyFatOrc":
               return Locale.loadStringEx("ENEMY_FAT_ORC_NAME",Locale.getDefaultLang());
            case "EnemyOgre":
               return Locale.loadStringEx("ENEMY_OGRE_NAME",Locale.getDefaultLang());
            case "EnemyWolfSmall":
               return Locale.loadStringEx("ENEMY_WULF_NAME",Locale.getDefaultLang());
            case "EnemyShaman":
               return Locale.loadStringEx("ENEMY_SHAMAN_NAME",Locale.getDefaultLang());
            case "EnemyGargoyle":
               return Locale.loadStringEx("ENEMY_GARGOYLE_NAME",Locale.getDefaultLang());
            case "EnemySpider":
               return Locale.loadStringEx("ENEMY_SPIDER_NAME",Locale.getDefaultLang());
            case "EnemyBandit":
               return Locale.loadStringEx("ENEMY_BANDIT_NAME",Locale.getDefaultLang());
            case "EnemyBrigand":
               return Locale.loadStringEx("ENEMY_BRIGAND_NAME",Locale.getDefaultLang());
            case "EnemyMarauder":
               return Locale.loadStringEx("ENEMY_MARAUDER_NAME",Locale.getDefaultLang());
            case "EnemyWolf":
               return Locale.loadStringEx("ENEMY_WORG_NAME",Locale.getDefaultLang());
            case "EnemySpider":
               return Locale.loadStringEx("ENEMY_SPIDER_NAME",Locale.getDefaultLang());
            case "EnemySpiderSmall":
               return Locale.loadStringEx("ENEMY_SPIDERSMALL_NAME",Locale.getDefaultLang());
            case "EnemySpiderTiny":
               return Locale.loadStringEx("ENEMY_SPIDERTINY_NAME",Locale.getDefaultLang());
            case "EnemyShadowArcher":
               return Locale.loadStringEx("ENEMY_SHADOW_ARCHER_NAME",Locale.getDefaultLang());
            case "EnemyDarkKnight":
               return Locale.loadStringEx("ENEMY_DARK_NIGHT_NAME",Locale.getDefaultLang());
            case "EnemyJuggernaut":
               return Locale.loadStringEx("ENEMY_JUGGERNAUT_NAME",Locale.getDefaultLang());
            case "EnemyGolemHead":
               return Locale.loadStringEx("ENEMY_GOLEM_HEAD_NAME",Locale.getDefaultLang());
            case "EnemyWhiteWolf":
               return Locale.loadStringEx("ENEMY_WHITE_WOLF_NAME",Locale.getDefaultLang());
            case "EnemyTroll":
               return Locale.loadStringEx("ENEMY_TROLL_NAME",Locale.getDefaultLang());
            case "EnemyTrollChieftain":
               return Locale.loadStringEx("ENEMY_TROLL_CHIEFTAIN_NAME",Locale.getDefaultLang());
            case "EnemyTrollAxeThrower":
               return Locale.loadStringEx("ENEMY_TROLL_AXE_THROWER_NAME",Locale.getDefaultLang());
            case "EnemyYeti":
               return Locale.loadStringEx("ENEMY_YETI_NAME",Locale.getDefaultLang());
            case "EnemyBoss":
               return Locale.loadStringEx("ENEMY_YETI_BOSS_NAME",Locale.getDefaultLang());
            case "EnemyYetiBoss":
               return Locale.loadStringEx("ENEMY_YETI_BOSS_NAME",Locale.getDefaultLang());
            case "EnemySlayer":
               return Locale.loadStringEx("ENEMY_SLAYER_NAME",Locale.getDefaultLang());
            case "EnemyRocketeer":
               return Locale.loadStringEx("ENEMY_ROCKETEER_NAME",Locale.getDefaultLang());
            case "EnemyNecromancer":
               return Locale.loadStringEx("ENEMY_NECROMANCER_NAME",Locale.getDefaultLang());
            case "EnemySkeleton":
               return Locale.loadStringEx("ENEMY_SKELETON_NAME",Locale.getDefaultLang());
            case "EnemySkeletonBig":
               return Locale.loadStringEx("ENEMY_SKELETON_BIG_NAME",Locale.getDefaultLang());
            case "EnemyDemonWolf":
               return Locale.loadStringEx("ENEMY_DEMON_WOLF_NAME",Locale.getDefaultLang());
            case "EnemyDemon":
               return Locale.loadStringEx("ENEMY_DEMON_NAME",Locale.getDefaultLang());
            case "EnemyDemonMage":
               return Locale.loadStringEx("ENEMY_DEMON_MAGE_NAME",Locale.getDefaultLang());
            case "EnemyDemonWolf":
               return Locale.loadStringEx("ENEMY_DEMON_WOLF_NAME",Locale.getDefaultLang());
            case "EnemyDemonImp":
               return Locale.loadStringEx("ENEMY_DEMON_IMP_NAME",Locale.getDefaultLang());
            case "EnemyLavaElemental":
               return Locale.loadStringEx("ENEMY_LAVA_ELEMENTAL_NAME",Locale.getDefaultLang());
            case "EnemyVeznan":
               return Locale.loadStringEx("ENEMY_VEZNAN_NAME",Locale.getDefaultLang());
            case "EnemySarelgaz":
               return Locale.loadStringEx("ENEMY_SARELGAZ_NAME",Locale.getDefaultLang());
            case "EnemySarelgazSmall":
               return Locale.loadStringEx("ENEMY_SARELGAZ_SMALL_NAME",Locale.getDefaultLang());
            case "EnemyGoblinZapper":
               return Locale.loadStringEx("ENEMY_GOBLIN_ZAPPER_NAME",Locale.getDefaultLang());
            case "EnemyForestTroll":
               return Locale.loadStringEx("ENEMY_FOREST_TROLL_NAME",Locale.getDefaultLang());
            case "EnemyOrcWolfRider":
               return Locale.loadStringEx("ENEMY_ORC_WOLF_RIDER_NAME",Locale.getDefaultLang());
            case "EnemyOrcArmored":
               return Locale.loadStringEx("ENEMY_ORC_ARMORED_NAME",Locale.getDefaultLang());
            case "EnemyBossGoblinChieftain":
               return Locale.loadStringEx("ENEMY_BOSS_GOBLIN_CHIEFTAIN_NAME",Locale.getDefaultLang());
            case "EnemyZombie":
               return Locale.loadStringEx("ENEMY_ZOMBIE_NAME",Locale.getDefaultLang());
            case "EnemyRottenSpider":
               return Locale.loadStringEx("ENEMY_ROTTEN_SPIDER_NAME",Locale.getDefaultLang());
            case "EnemySpiderTinyRotten":
               return Locale.loadStringEx("ENEMY_ROTTEN_SPIDER_TINY_NAME",Locale.getDefaultLang());
            case "EnemyThing":
               return Locale.loadStringEx("ENEMY_THE_THING_NAME",Locale.getDefaultLang());
            case "EnemyRottenTree":
               return Locale.loadStringEx("ENEMY_ROTTEN_TREE_NAME",Locale.getDefaultLang());
            case "EnemyRottenBoss":
               return Locale.loadStringEx("ENEMY_ROTTEN_TREE_BOSS_NAME",Locale.getDefaultLang());
            case "EnemyRaider":
               return Locale.loadStringEx("ENEMY_RAIDER_NAME",Locale.getDefaultLang());
            case "EnemyPillager":
               return Locale.loadStringEx("ENEMY_PILLAGER_NAME",Locale.getDefaultLang());
            case "EnemyBossBandit":
               return Locale.loadStringEx("ENEMY_BANDIT_BOSS_NAME",Locale.getDefaultLang());
            default:
               return null;
         }
      }
      
      private function §_-M§() : void
      {
         var _loc1_:* = new Object();
         this.mages.building = _loc1_;
         var _loc2_:* = new Object();
         _loc2_.cost = 100;
         _loc2_.range = 220;
         _loc2_.minDamage = 9;
         _loc2_.maxDamage = 17;
         _loc2_.reload = 1.5 * this.framesRate;
         this.mages.level1 = _loc2_;
         var _loc3_:* = new Object();
         _loc3_.cost = 160;
         _loc3_.range = 250;
         _loc3_.minDamage = 23;
         _loc3_.maxDamage = 43;
         _loc3_.reload = 1.5 * this.framesRate;
         this.mages.level2 = _loc3_;
         var _loc4_:* = new Object();
         _loc4_.cost = 240;
         _loc4_.range = 280;
         _loc4_.minDamage = 40;
         _loc4_.maxDamage = 74;
         _loc4_.reload = 1.5 * this.framesRate;
         this.mages.level3 = _loc4_;
         var _loc5_:* = new Object();
         _loc5_.cost = 300;
         _loc5_.range = 310;
         _loc5_.minDamage = 76;
         _loc5_.maxDamage = 140;
         _loc5_.reload = 2 * this.framesRate;
         _loc5_.deathRayCost = 350;
         _loc5_.deathRayCostLevel = 200;
         _loc5_.deathRayCoolDown = 22 * this.framesRate;
         _loc5_.deathRayLessCoolDown = 2 * this.framesRate;
         _loc5_.deathRayLevels = 3;
         _loc5_.teleportCost = 300;
         _loc5_.teleportCostLevel = 100;
         _loc5_.teleportRange = 50;
         _loc5_.teleportMaxEnemies = 3;
         _loc5_.teleportExtraEnemies = 1;
         _loc5_.teleportNodes = 20;
         _loc5_.teleportExtraNodes = 5;
         _loc5_.teleportCoolDown = 10 * this.framesRate;
         _loc5_.teleportLevels = 3;
         _loc5_.teleportMaxTimes = 3;
         this.mages.arcane = _loc5_;
         var _loc6_:* = new Object();
         _loc6_.cost = 300;
         _loc6_.range = 310;
         _loc6_.minDamage = 42;
         _loc6_.maxDamage = 78;
         _loc6_.reload = 1.5 * this.framesRate;
         _loc6_.curseDamage = 10;
         _loc6_.curseArmorReduce = 50;
         _loc6_.curseDuration = 5 * this.framesRate;
         _loc6_.polymorphCost = 300;
         _loc6_.polymorphCostLevel = 150;
         _loc6_.polymorphDamage = 50;
         _loc6_.polymorphCoolDown = 22 * this.framesRate;
         _loc6_.polymorphLessCoolDown = 2 * this.framesRate;
         _loc6_.polymorphSpeedMultiplier = 1.5;
         _loc6_.polymorphLevels = 3;
         _loc6_.elementalRallyRange = 280;
         _loc6_.elementalMaxSize = §_-d§;
         _loc6_.elementalCost = 350;
         _loc6_.elementalCostLevel = 150;
         _loc6_.elementalMaxLevel = 10;
         _loc6_.elementalRange = 120;
         _loc6_.elementalHealth = 500;
         _loc6_.elementalExtraHealth = 100;
         _loc6_.elementalRegen = 20;
         _loc6_.elementalRegenReload = 1 * this.framesRate;
         _loc6_.elementalAreaAttackRangeWidth = 70;
         _loc6_.elementalAreaAttackMaxEnemies = 4;
         _loc6_.elementalMinDamage = 40;
         _loc6_.elementalMaxDamage = 80;
         _loc6_.elementalDamageExtra = 10;
         _loc6_.elementalArmor = 30;
         _loc6_.elementalArmorExtra = 10;
         _loc6_.elementalReload = 2 * this.framesRate;
         _loc6_.elementalRespawnTime = 8 * this.framesRate;
         _loc6_.elementalLevels = 3;
         this.mages.sorcerer = _loc6_;
      }
      
      private function §_-G8§() : void
      {
         var _loc1_:* = new Object();
         this.archers.building = _loc1_;
         var _loc2_:* = new Object();
         _loc2_.cost = 70;
         _loc2_.range = 220;
         _loc2_.minDamage = 4;
         _loc2_.maxDamage = 6;
         _loc2_.reload = 0.8 * this.framesRate;
         this.archers.level1 = _loc2_;
         var _loc3_:* = new Object();
         _loc3_.cost = 110;
         _loc3_.range = 250;
         _loc3_.minDamage = 7;
         _loc3_.maxDamage = 11;
         _loc3_.reload = 0.6 * this.framesRate;
         this.archers.level2 = _loc3_;
         var _loc4_:* = new Object();
         _loc4_.cost = 160;
         _loc4_.range = 280;
         _loc4_.minDamage = 10;
         _loc4_.maxDamage = 16;
         _loc4_.reload = 0.5 * this.framesRate;
         this.archers.level3 = _loc4_;
         var _loc5_:* = new Object();
         _loc5_.cost = 230;
         _loc5_.range = 310;
         _loc5_.minDamage = 13;
         _loc5_.maxDamage = 19;
         _loc5_.reload = 0.4 * this.framesRate;
         _loc5_.poisonCost = 250;
         _loc5_.poisonCostLevel = 250;
         _loc5_.poisonDuration = 3 * this.framesRate;
         _loc5_.poisonDamage = 5;
         _loc5_.poisonCoolDown = 0.4 * this.framesRate;
         _loc5_.poisonLevels = 3;
         _loc5_.thornCost = 300;
         _loc5_.thornCostLevel = 150;
         _loc5_.thornMinEnemies = 2;
         _loc5_.thornMaxEnemies = 2;
         _loc5_.thornDuration = 1 * this.framesRate;
         _loc5_.thornDamageTime = 1 * this.framesRate;
         _loc5_.thornDamage = 40;
         _loc5_.thornCoolDown = 8 * this.framesRate;
         _loc5_.thornLevels = 3;
         _loc5_.thornMaxTimes = 3;
         this.archers.ranger = _loc5_;
         var _loc6_:* = new Object();
         _loc6_.cost = 230;
         _loc6_.range = 370;
         _loc6_.minDamage = 35;
         _loc6_.maxDamage = 65;
         _loc6_.reload = 1.5 * this.framesRate;
         _loc6_.sniperCost = 250;
         _loc6_.sniperCostLevel = 250;
         _loc6_.sniperRange = 1.5;
         _loc6_.sniperDamagePercent = 20;
         _loc6_.sniperCoolDown = 14 * this.framesRate;
         _loc6_.sniperLevels = 3;
         _loc6_.shrapnelCost = 300;
         _loc6_.shrapnelCostLevel = 300;
         _loc6_.shrapnelRange = 0.5;
         _loc6_.shrapnelArea = 50;
         _loc6_.shrapnelMinDamage = 50 / 5;
         _loc6_.shrapnelMaxDamage = 200 / 5;
         _loc6_.shrapnelCoolDown = 9 * this.framesRate;
         _loc6_.shrapnelLevels = 3;
         this.archers.musketeer = _loc6_;
      }
      
      private function §_-4h§() : void
      {
         var _loc1_:* = new Object();
         this.engineers.building = _loc1_;
         var _loc2_:* = new Object();
         _loc2_.cost = 125;
         _loc2_.range = 250;
         _loc2_.area = 65;
         _loc2_.minDamage = 8;
         _loc2_.maxDamage = 15;
         _loc2_.reload = 3 * this.framesRate;
         this.engineers.level1 = _loc2_;
         var _loc3_:* = new Object();
         _loc3_.cost = 220;
         _loc3_.range = 250;
         _loc3_.area = 65;
         _loc3_.minDamage = 15;
         _loc3_.maxDamage = 30;
         _loc3_.reload = 3 * this.framesRate;
         this.engineers.level2 = _loc3_;
         var _loc4_:* = new Object();
         _loc4_.cost = 320;
         _loc4_.range = 280;
         _loc4_.area = 70;
         _loc4_.minDamage = 30;
         _loc4_.maxDamage = 60;
         _loc4_.reload = 3 * this.framesRate;
         this.engineers.level3 = _loc4_;
         var _loc5_:* = new Object();
         _loc5_.cost = 400;
         _loc5_.range = 280;
         _loc5_.area = 70;
         _loc5_.minDamage = 50;
         _loc5_.maxDamage = 100;
         _loc5_.reload = 3.5 * this.framesRate;
         _loc5_.missileCost = 250;
         _loc5_.missileCostLevel = 125;
         _loc5_.missileRangeIncrement = 0.2;
         _loc5_.missileArea = 40;
         _loc5_.missileMinDamage = 60;
         _loc5_.missileMaxDamage = 100;
         _loc5_.missileIncrementDamage = 40;
         _loc5_.missileCoolDown = 11 * this.framesRate;
         _loc5_.missileLevels = 3;
         _loc5_.clusterCost = 250;
         _loc5_.clusterCostLevel = 125;
         _loc5_.clusterArea = 70;
         _loc5_.clusterMinDamage = 60;
         _loc5_.clusterMaxDamage = 80;
         _loc5_.clusterMinBombs = 1;
         _loc5_.clusterIncrementBombs = 2;
         _loc5_.clusterCoolDown = 17 * this.framesRate;
         _loc5_.clusterLevels = 3;
         this.engineers.bfg = _loc5_;
         var _loc6_:* = new Object();
         _loc6_.cost = 375;
         _loc6_.range = 260;
         _loc6_.minDamage = 60;
         _loc6_.maxDamage = 110;
         _loc6_.reload = 2.2 * this.framesRate;
         _loc6_.chargedBoltCost = 250;
         _loc6_.chargedBoltCostLevel = 250;
         _loc6_.chargedBoltEnemies = 3;
         _loc6_.chargedBoltIncrementEnemies = 1;
         _loc6_.chargedBoltCoolDown = 6 * this.framesRate;
         _loc6_.chargedBoltLevels = 2;
         _loc6_.chargedBoltRange = 80;
         _loc6_.overchargeCost = 250;
         _loc6_.overchargeCostLevel = 125;
         _loc6_.overchargeArea = 260;
         _loc6_.overchargeMinDamage = 0;
         _loc6_.overchargeMaxDamage = 10;
         _loc6_.overchargeDamageIncrement = 10;
         _loc6_.overchargeCoolDown = 6 * this.framesRate;
         _loc6_.overchargeLevels = 3;
         _loc6_.overchargeDisplayRatio = 0.7;
         this.engineers.tesla = _loc6_;
      }
      
      private function §_-1i§() : void
      {
         var _loc1_:* = new Object();
         this.engineers.building = _loc1_;
         var _loc2_:* = new Object();
         _loc2_.cost = 70;
         _loc2_.maxSize = MEDIUM;
         _loc2_.maxLevel = 5;
         _loc2_.rangeRally = 230;
         _loc2_.range = 100;
         _loc2_.health = 50 * this.§_-Nx§;
         _loc2_.armor = 0;
         _loc2_.minDamage = 1;
         _loc2_.maxDamage = 3;
         _loc2_.reload = 1 * this.framesRate;
         _loc2_.respawn = 10 * this.framesRate;
         _loc2_.regen = 5;
         _loc2_.regenReload = 1 * this.framesRate;
         this.soldiers.level1 = _loc2_;
         var _loc3_:* = new Object();
         _loc3_.cost = 110;
         _loc3_.maxSize = MEDIUM;
         _loc3_.maxLevel = 5;
         _loc3_.rangeRally = 230;
         _loc3_.range = 100;
         _loc3_.health = 100 * this.§_-Nx§;
         _loc3_.armor = 15;
         _loc3_.minDamage = 3;
         _loc3_.maxDamage = 4;
         _loc3_.reload = 1 * this.framesRate;
         _loc3_.respawn = 10 * this.framesRate;
         _loc3_.regen = 7;
         _loc3_.regenReload = 1 * this.framesRate;
         this.soldiers.level2 = _loc3_;
         var _loc4_:* = new Object();
         _loc4_.cost = 160;
         _loc4_.maxSize = MEDIUM;
         _loc4_.maxLevel = 5;
         _loc4_.rangeRally = 230;
         _loc4_.range = 100;
         _loc4_.health = 150 * this.§_-Nx§;
         _loc4_.armor = 30;
         _loc4_.minDamage = 6;
         _loc4_.maxDamage = 10;
         _loc4_.reload = 1 * this.framesRate;
         _loc4_.respawn = 10 * this.framesRate;
         _loc4_.regen = 10;
         _loc4_.regenReload = 1 * this.framesRate;
         this.soldiers.level3 = _loc4_;
         var _loc5_:* = new Object();
         _loc5_.cost = 230;
         _loc5_.maxSize = MEDIUM;
         _loc5_.maxLevel = 5;
         _loc5_.rangeRally = 230;
         _loc5_.range = 100;
         _loc5_.health = 200 * this.§_-Nx§;
         _loc5_.armor = 50;
         _loc5_.minDamage = 12;
         _loc5_.maxDamage = 18;
         _loc5_.reload = 1 * this.framesRate;
         _loc5_.respawn = 14 * this.framesRate;
         _loc5_.regen = 25;
         _loc5_.regenReload = 1 * this.framesRate;
         _loc5_.healingCost = 150;
         _loc5_.healingCostLevel = 150;
         _loc5_.healingMin = 40;
         _loc5_.healingMax = 60;
         _loc5_.healingCoolDown = 10 * this.framesRate;
         _loc5_.healingLevels = 3;
         _loc5_.holyStrikeCost = 220;
         _loc5_.holyStrikeCostLevel = 150;
         _loc5_.holyStrikeRange = 80;
         _loc5_.holyStrikeMinEnemies = 1;
         _loc5_.holyStrikeMinDamage = 25;
         _loc5_.holyStrikeMaxDamage = 45;
         _loc5_.holyStrikeChance = 10;
         _loc5_.holyStrikeLevels = 3;
         _loc5_.shieldCost = 250;
         _loc5_.shieldCostLevel = 100;
         _loc5_.shieldArmor = 15;
         _loc5_.shieldMaxSize = §_-d§;
         _loc5_.shieldLevels = 1;
         this.soldiers.paladin = _loc5_;
         var _loc6_:* = new Object();
         _loc6_.cost = 230;
         _loc6_.maxSize = MEDIUM;
         _loc6_.maxLevel = 5;
         _loc6_.rangeRally = 230;
         _loc6_.range = 100;
         _loc6_.health = 250 * this.§_-Nx§;
         _loc6_.armor = 0;
         _loc6_.minDamage = 16;
         _loc6_.maxDamage = 24;
         _loc6_.reload = 1 * this.framesRate;
         _loc6_.respawn = 10 * this.framesRate;
         _loc6_.regen = 20;
         _loc6_.regenReload = 1 * this.framesRate;
         _loc6_.dualWeaponsCost = 300;
         _loc6_.dualWeaponsCostLevel = 100;
         _loc6_.dualWeaponsIncrementDamage = 10;
         _loc6_.dualWeaponsLevels = 3;
         _loc6_.throwingCost = 200;
         _loc6_.throwingCostLevel = 100;
         _loc6_.throwingCoolDown = 3 * this.framesRate;
         _loc6_.throwingRange = 240;
         _loc6_.throwingMinRange = 40;
         _loc6_.throwingMinDamage = 24;
         _loc6_.throwingMaxDamage = 32;
         _loc6_.throwingIncrementDamage = 10;
         _loc6_.throwingIncrementRange = 20;
         _loc6_.throwingLevels = 3;
         _loc6_.huntingNetsCost = 150;
         _loc6_.huntingNetsCostLevel = 75;
         _loc6_.huntingNetsCoolDown = 3 * this.framesRate;
         _loc6_.huntingNetsRange = 150;
         _loc6_.huntingNetsDuration = 3 * this.framesRate;
         _loc6_.huntingNetsNewSpeed = 30;
         _loc6_.huntingNetsNewSpeedIncrement = 15;
         _loc6_.huntingNetsLevels = 3;
         this.soldiers.barbarian = _loc6_;
      }
      
      private function §_-9T§() : void
      {
         var _loc27_:* = undefined;
         var _loc28_:* = undefined;
         var _loc29_:* = undefined;
         var _loc30_:* = undefined;
         var _loc31_:* = undefined;
         var _loc32_:* = undefined;
         var _loc33_:* = undefined;
         var _loc34_:* = undefined;
         var _loc35_:* = undefined;
         var _loc36_:* = undefined;
         var _loc37_:* = undefined;
         var _loc38_:* = undefined;
         var _loc39_:* = undefined;
         var _loc40_:* = undefined;
         var _loc41_:* = undefined;
         var _loc42_:* = undefined;
         var _loc43_:* = undefined;
         var _loc44_:* = undefined;
         var _loc45_:* = undefined;
         var _loc46_:* = undefined;
         var _loc47_:* = undefined;
         var _loc48_:* = undefined;
         var _loc49_:* = undefined;
         var _loc50_:* = undefined;
         var _loc1_:* = new Object();
         _loc1_.className = "EnemyGoblin";
         _loc1_.elite = false;
         _loc1_.size = §_-PP§;
         _loc1_.isFlying = false;
         _loc1_.health = Math.round(20 * this.§_-26§);
         _loc1_.armor = 0;
         _loc1_.magicArmor = 0;
         _loc1_.dodge = 0;
         _loc1_.speed = 1.2;
         _loc1_.gold = 3;
         _loc1_.cost = 1;
         _loc1_.minDamage = 1;
         _loc1_.maxDamage = 4;
         _loc1_.attackReloadTime = 1 * this.framesRate;
         _loc1_.xSoldierAdjust = 15;
         _loc1_.xAdjust = 0;
         _loc1_.yAdjust = -8;
         this.enemies.goblin = _loc1_;
         var _loc2_:* = new Object();
         _loc2_.className = "EnemyWolfSmall";
         _loc2_.elite = false;
         _loc2_.size = §_-PP§;
         _loc2_.isFlying = false;
         _loc2_.health = Math.round(35 * this.§_-26§);
         _loc2_.armor = 0;
         _loc2_.magicArmor = 0;
         _loc2_.dodge = 30;
         _loc2_.speed = 2.5;
         _loc2_.gold = 5;
         _loc2_.cost = 1;
         _loc2_.minDamage = 1;
         _loc2_.maxDamage = 3;
         _loc2_.attackReloadTime = 1 * this.framesRate;
         _loc2_.xSoldierAdjust = 15;
         _loc2_.xAdjust = 0;
         _loc2_.yAdjust = -8;
         this.enemies.wolfSmall = _loc2_;
         var _loc3_:* = new Object();
         _loc3_.className = "EnemyFatOrc";
         _loc3_.elite = false;
         _loc3_.size = MEDIUM;
         _loc3_.isFlying = false;
         _loc3_.health = Math.round(80 * this.§_-26§);
         _loc3_.armor = 30;
         _loc3_.magicArmor = 0;
         _loc3_.dodge = 0;
         _loc3_.speed = 0.8;
         _loc3_.gold = 9;
         _loc3_.cost = 1;
         _loc3_.minDamage = 4;
         _loc3_.maxDamage = 8;
         _loc3_.attackReloadTime = 1 * this.framesRate;
         _loc3_.xSoldierAdjust = 15;
         _loc3_.xAdjust = 0;
         _loc3_.yAdjust = -8;
         this.enemies.fatOrc = _loc3_;
         var _loc4_:* = new Object();
         _loc4_.className = "EnemyShaman";
         _loc4_.elite = false;
         _loc4_.size = §_-PP§;
         _loc4_.isFlying = false;
         _loc4_.health = Math.round(100 * this.§_-26§);
         _loc4_.armor = 0;
         _loc4_.magicArmor = 85;
         _loc4_.dodge = 0;
         _loc4_.speed = 1;
         _loc4_.gold = 10;
         _loc4_.cost = 1;
         _loc4_.minDamage = 3;
         _loc4_.maxDamage = 5;
         _loc4_.attackReloadTime = 1 * this.framesRate;
         _loc4_.xSoldierAdjust = 15;
         _loc4_.xAdjust = 0;
         _loc4_.yAdjust = -8;
         _loc4_.healMaxEnemies = 3;
         _loc4_.healCoolDown = 8 * this.framesRate;
         _loc4_.healRange = 150;
         _loc4_.healPoints = 50;
         this.enemies.shaman = _loc4_;
         var _loc5_:* = new Object();
         _loc5_.className = "EnemyOgre";
         _loc5_.elite = false;
         _loc5_.size = §_-d§;
         _loc5_.isFlying = false;
         _loc5_.health = Math.round(800 * this.§_-26§);
         _loc5_.armor = 0;
         _loc5_.magicArmor = 0;
         _loc5_.dodge = 0;
         _loc5_.speed = 0.7;
         _loc5_.gold = 50;
         _loc5_.cost = 3;
         _loc5_.minDamage = 40;
         _loc5_.maxDamage = 60;
         _loc5_.attackReloadTime = 1 * this.framesRate;
         _loc5_.xSoldierAdjust = 25;
         _loc5_.xAdjust = 3;
         _loc5_.yAdjust = -18;
         this.enemies.ogre = _loc5_;
         var _loc6_:* = new Object();
         _loc6_.className = "EnemyBandit";
         _loc6_.elite = false;
         _loc6_.size = §_-PP§;
         _loc6_.isFlying = false;
         _loc6_.health = Math.round(70 * this.§_-26§);
         _loc6_.armor = 0;
         _loc6_.magicArmor = 0;
         _loc6_.dodge = 50;
         _loc6_.speed = 1.2;
         _loc6_.gold = 8;
         _loc6_.cost = 1;
         _loc6_.minDamage = 20;
         _loc6_.maxDamage = 30;
         _loc6_.attackReloadTime = 1 * this.framesRate;
         _loc6_.xSoldierAdjust = 15;
         _loc6_.xAdjust = 0;
         _loc6_.yAdjust = -8;
         this.enemies.bandit = _loc6_;
         var _loc7_:* = new Object();
         _loc7_.className = "EnemyBrigand";
         _loc7_.elite = false;
         _loc7_.size = §_-PP§;
         _loc7_.isFlying = false;
         _loc7_.health = Math.round(160 * this.§_-26§);
         _loc7_.armor = 50;
         _loc7_.magicArmor = 0;
         _loc7_.dodge = 0;
         _loc7_.speed = 0.8;
         _loc7_.gold = 15;
         _loc7_.cost = 1;
         _loc7_.minDamage = 6;
         _loc7_.maxDamage = 10;
         _loc7_.attackReloadTime = 1 * this.framesRate;
         _loc7_.xSoldierAdjust = 15;
         _loc7_.xAdjust = 0;
         _loc7_.yAdjust = -8;
         this.enemies.brigand = _loc7_;
         var _loc8_:* = new Object();
         _loc8_.className = "EnemyMarauder";
         _loc8_.elite = false;
         _loc8_.size = §_-d§;
         _loc8_.isFlying = false;
         _loc8_.health = Math.round(600 * this.§_-26§);
         _loc8_.armor = 60;
         _loc8_.magicArmor = 0;
         _loc8_.dodge = 0;
         _loc8_.speed = 0.8;
         _loc8_.gold = 40;
         _loc8_.cost = 3;
         _loc8_.minDamage = 16;
         _loc8_.maxDamage = 24;
         _loc8_.attackReloadTime = 1 * this.framesRate;
         _loc8_.xSoldierAdjust = 20;
         _loc8_.xAdjust = 0;
         _loc8_.yAdjust = -18;
         this.enemies.marauder = _loc8_;
         var _loc9_:* = new Object();
         _loc9_.className = "EnemyWolf";
         _loc9_.elite = false;
         _loc9_.size = MEDIUM;
         _loc9_.isFlying = false;
         _loc9_.health = Math.round(120 * this.§_-26§);
         _loc9_.armor = 0;
         _loc9_.magicArmor = 50;
         _loc9_.dodge = 50;
         _loc9_.speed = 2;
         _loc9_.gold = 12;
         _loc9_.cost = 1;
         _loc9_.minDamage = 12;
         _loc9_.maxDamage = 18;
         _loc9_.attackReloadTime = 1 * this.framesRate;
         _loc9_.xSoldierAdjust = 20;
         _loc9_.xAdjust = 0;
         _loc9_.yAdjust = -8;
         this.enemies.wolf = _loc9_;
         var _loc10_:* = new Object();
         _loc10_.className = "EnemySpider";
         _loc10_.elite = false;
         _loc10_.size = §_-PP§;
         _loc10_.isFlying = false;
         _loc10_.health = Math.round(250 * this.§_-26§);
         _loc10_.armor = 0;
         _loc10_.magicArmor = 80;
         _loc10_.dodge = 0;
         _loc10_.speed = 1;
         _loc10_.gold = 20;
         _loc10_.cost = 2;
         _loc10_.minDamage = 15;
         _loc10_.maxDamage = 25;
         _loc10_.attackReloadTime = 1 * this.framesRate;
         _loc10_.xSoldierAdjust = 24;
         _loc10_.xAdjust = 1;
         _loc10_.yAdjust = -8;
         _loc10_.eggsMax = 3;
         _loc10_.eggsSpiders = 3;
         _loc10_.eggsCooldownTimeMin = 4 * this.framesRate;
         _loc10_.eggsCooldownTimeMax = 8 * this.framesRate;
         this.enemies.spider = _loc10_;
         var _loc11_:* = new Object();
         _loc11_.className = "EnemySpiderTiny";
         _loc11_.elite = false;
         _loc11_.size = §_-PP§;
         _loc11_.isFlying = false;
         _loc11_.health = Math.round(10 * this.§_-26§);
         _loc11_.armor = 0;
         _loc11_.magicArmor = 50;
         _loc11_.dodge = 0;
         _loc11_.speed = 2;
         _loc11_.gold = 0;
         _loc11_.cost = 1;
         _loc11_.minDamage = 1;
         _loc11_.maxDamage = 5;
         _loc11_.attackReloadTime = 1 * this.framesRate;
         _loc11_.xSoldierAdjust = 14;
         _loc11_.xAdjust = 1;
         _loc11_.yAdjust = -4;
         this.enemies.spiderTiny = _loc11_;
         var _loc12_:* = new Object();
         _loc12_.className = "EnemySpiderSmall";
         _loc12_.elite = false;
         _loc12_.size = §_-PP§;
         _loc12_.isFlying = false;
         _loc12_.health = Math.round(60 * this.§_-26§);
         _loc12_.armor = 0;
         _loc12_.magicArmor = 65;
         _loc12_.dodge = 0;
         _loc12_.speed = 1.5;
         _loc12_.gold = 6;
         _loc12_.cost = 1;
         _loc12_.minDamage = 10;
         _loc12_.maxDamage = 18;
         _loc12_.attackReloadTime = 1 * this.framesRate;
         _loc12_.xSoldierAdjust = 18;
         _loc12_.xAdjust = 1;
         _loc12_.yAdjust = -8;
         this.enemies.spiderSmall = _loc12_;
         var _loc13_:* = new Object();
         _loc13_.className = "EnemySarelgaz";
         _loc13_.elite = false;
         _loc13_.size = §_-PP§;
         _loc13_.isFlying = false;
         _loc13_.health = Math.round(18000 * this.§_-26§);
         _loc13_.armor = 0;
         _loc13_.magicArmor = 0;
         _loc13_.dodge = 0;
         _loc13_.speed = 0.4;
         _loc13_.gold = 0;
         _loc13_.cost = 20;
         _loc13_.minDamage = 300;
         _loc13_.maxDamage = 500;
         _loc13_.attackReloadTime = 1 * this.framesRate;
         _loc13_.xSoldierAdjust = 75;
         _loc13_.xAdjust = 1;
         _loc13_.yAdjust = -40;
         this.enemies.sarelgaz = _loc13_;
         var _loc14_:* = new Object();
         _loc14_.className = "EnemySarelgazSmall";
         _loc14_.elite = false;
         _loc14_.size = §_-PP§;
         _loc14_.isFlying = false;
         _loc14_.health = Math.round(1250 * this.§_-26§);
         _loc14_.armor = 70;
         _loc14_.magicArmor = 70;
         _loc14_.dodge = 0;
         _loc14_.speed = 0.8;
         _loc14_.gold = 80;
         _loc14_.cost = 1;
         _loc14_.minDamage = 50;
         _loc14_.maxDamage = 100;
         _loc14_.attackReloadTime = 1 * this.framesRate;
         _loc14_.xSoldierAdjust = 32;
         _loc14_.xAdjust = 1;
         _loc14_.yAdjust = -21;
         this.enemies.sarelgazSmall = _loc14_;
         var _loc15_:* = new Object();
         _loc15_.className = "EnemyShadowArcher";
         _loc15_.elite = false;
         _loc15_.size = §_-PP§;
         _loc15_.isFlying = false;
         _loc15_.health = Math.round(180 * this.§_-26§);
         _loc15_.armor = 0;
         _loc15_.magicArmor = 30;
         _loc15_.dodge = 0;
         _loc15_.speed = 1.2;
         _loc15_.gold = 16;
         _loc15_.cost = 1;
         _loc15_.minDamage = 10;
         _loc15_.maxDamage = 20;
         _loc15_.attackReloadTime = 1 * this.framesRate;
         _loc15_.xSoldierAdjust = 15;
         _loc15_.xAdjust = 1;
         _loc15_.yAdjust = -8;
         _loc15_.arrowCoolDown = 1 * this.framesRate;
         _loc15_.arrowRange = 230;
         _loc15_.arrowMinRange = 40;
         _loc15_.arrowMinDamage = 20;
         _loc15_.arrowMaxDamage = 30;
         this.enemies.shadowArcher = _loc15_;
         var _loc16_:* = new Object();
         _loc16_.className = "EnemyDarkKnight";
         _loc16_.elite = false;
         _loc16_.size = §_-PP§;
         _loc16_.isFlying = false;
         _loc16_.health = Math.round(300 * this.§_-26§);
         _loc16_.armor = 80;
         _loc16_.magicArmor = 0;
         _loc16_.dodge = 0;
         _loc16_.speed = 0.7;
         _loc16_.gold = 25;
         _loc16_.cost = 1;
         _loc16_.minDamage = 15;
         _loc16_.maxDamage = 25;
         _loc16_.attackReloadTime = 1 * this.framesRate;
         _loc16_.xSoldierAdjust = 20;
         _loc16_.xAdjust = 0;
         _loc16_.yAdjust = -10;
         this.enemies.darkKnight = _loc16_;
         var _loc17_:* = new Object();
         _loc17_.className = "EnemyGargoyle";
         _loc17_.elite = false;
         _loc17_.size = §_-PP§;
         _loc17_.isFlying = true;
         _loc17_.health = Math.round(90 * this.§_-26§);
         _loc17_.armor = 0;
         _loc17_.magicArmor = 0;
         _loc17_.dodge = 0;
         _loc17_.speed = 1.2;
         _loc17_.gold = 12;
         _loc17_.cost = 1;
         _loc17_.minDamage = 1;
         _loc17_.maxDamage = 2;
         _loc17_.attackReloadTime = 1 * this.framesRate;
         _loc17_.xSoldierAdjust = 15;
         _loc17_.xAdjust = 3;
         _loc17_.yAdjust = -45;
         this.enemies.gargoyle = _loc17_;
         var _loc18_:* = new Object();
         _loc18_.className = "EnemyJuggernaut";
         _loc18_.elite = false;
         _loc18_.size = §_-d§;
         _loc18_.isFlying = false;
         _loc18_.health = Math.round(10000 * this.§_-26§);
         _loc18_.armor = 0;
         _loc18_.magicArmor = 0;
         _loc18_.dodge = 0;
         _loc18_.speed = 0.4;
         _loc18_.gold = 0;
         _loc18_.cost = 20;
         _loc18_.attackReloadTime = 2 * this.framesRate;
         _loc18_.xSoldierAdjust = 35;
         _loc18_.xAdjust = 0;
         _loc18_.yAdjust = -30;
         _loc18_.missileCoolDown = 9 * this.framesRate;
         _loc18_.missileMinRange = 100;
         _loc18_.missileMinDamage = 150;
         _loc18_.missileMaxDamage = 250;
         _loc18_.areaAttackRangeWidth = 90;
         _loc18_.minDamage = 150;
         _loc18_.maxDamage = 250;
         _loc18_.areaAttackMaxEnemies = 10;
         _loc18_.golemHeads = 7;
         _loc18_.spawnCooldownTime = 6 * this.framesRate;
         this.enemies.juggernaut = _loc18_;
         var _loc19_:* = new Object();
         _loc19_.className = "EnemyGolemHead";
         _loc19_.elite = false;
         _loc19_.size = §_-PP§;
         _loc19_.isFlying = false;
         _loc19_.health = Math.round(125 * this.§_-26§);
         _loc19_.armor = 0;
         _loc19_.magicArmor = 0;
         _loc19_.dodge = 0;
         _loc19_.speed = 0.7;
         _loc19_.gold = 10;
         _loc19_.cost = 1;
         _loc19_.minDamage = 10;
         _loc19_.maxDamage = 20;
         _loc19_.attackReloadTime = 1 * this.framesRate;
         _loc19_.xSoldierAdjust = 14;
         _loc19_.xAdjust = 1;
         _loc19_.yAdjust = -8;
         this.enemies.golemHead = _loc19_;
         var _loc20_:* = new Object();
         _loc20_.className = "EnemyWhiteWolf";
         _loc20_.elite = false;
         _loc20_.size = §_-PP§;
         _loc20_.isFlying = false;
         _loc20_.health = Math.round(350 * this.§_-26§);
         _loc20_.armor = 0;
         _loc20_.magicArmor = 50;
         _loc20_.dodge = 50;
         _loc20_.speed = 2;
         _loc20_.gold = 35;
         _loc20_.cost = 1;
         _loc20_.minDamage = 20;
         _loc20_.maxDamage = 40;
         _loc20_.attackReloadTime = 1 * this.framesRate;
         _loc20_.xSoldierAdjust = 15;
         _loc20_.xAdjust = 0;
         _loc20_.yAdjust = -8;
         _loc20_.regenerateTime = 30;
         _loc20_.regenerateHealPoints = 0;
         this.enemies.whiteWolf = _loc20_;
         var _loc21_:* = new Object();
         _loc21_.className = "EnemyTroll";
         _loc21_.elite = false;
         _loc21_.size = §_-PP§;
         _loc21_.isFlying = false;
         _loc21_.health = Math.round(280 * this.§_-26§);
         _loc21_.armor = 0;
         _loc21_.magicArmor = 0;
         _loc21_.dodge = 0;
         _loc21_.speed = 0.9;
         _loc21_.gold = 25;
         _loc21_.cost = 1;
         _loc21_.minDamage = 20;
         _loc21_.maxDamage = 40;
         _loc21_.attackReloadTime = 1 * this.framesRate;
         _loc21_.xSoldierAdjust = 15;
         _loc21_.xAdjust = 0;
         _loc21_.yAdjust = -8;
         _loc21_.regenerateTime = 5;
         _loc21_.regenerateHealPoints = 1;
         this.enemies.troll = _loc21_;
         var _loc22_:* = new Object();
         _loc22_.className = "EnemyTrollChieftain";
         _loc22_.elite = false;
         _loc22_.size = §_-d§;
         _loc22_.isFlying = false;
         _loc22_.health = Math.round(1200 * this.§_-26§);
         _loc22_.armor = 0;
         _loc22_.magicArmor = 0;
         _loc22_.dodge = 0;
         _loc22_.speed = 0.6;
         _loc22_.gold = 70;
         _loc22_.cost = 6;
         _loc22_.minDamage = 10;
         _loc22_.maxDamage = 30;
         _loc22_.attackReloadTime = 1 * this.framesRate;
         _loc22_.xSoldierAdjust = 25;
         _loc22_.xAdjust = 0;
         _loc22_.yAdjust = -18;
         _loc22_.rageMaxEnemies = 3;
         _loc22_.rageCoolDown = 6 * this.framesRate;
         _loc22_.rageDurationTime = 6 * this.framesRate;
         _loc22_.rageRange = 280;
         _loc22_.rageHealPoints = 50;
         _loc22_.rageAddedMinDamage = 15;
         _loc22_.rageAddedMaxDamage = 30;
         _loc22_.rageAddedSpeed = 0.8;
         _loc22_.rageAddedArmor = 50;
         _loc22_.regenerateTime = 5;
         _loc22_.regenerateHealPoints = 4;
         this.enemies.trollChieftain = _loc22_;
         var _loc23_:* = new Object();
         _loc23_.className = "EnemyTrollAxeThrower";
         _loc23_.elite = false;
         _loc23_.size = §_-d§;
         _loc23_.isFlying = false;
         _loc23_.health = Math.round(600 * this.§_-26§);
         _loc23_.armor = 0;
         _loc23_.magicArmor = 0;
         _loc23_.dodge = 0;
         _loc23_.speed = 0.8;
         _loc23_.gold = 50;
         _loc23_.cost = 3;
         _loc23_.minDamage = 30;
         _loc23_.maxDamage = 50;
         _loc23_.attackReloadTime = 1 * this.framesRate;
         _loc23_.xSoldierAdjust = 15;
         _loc23_.xAdjust = 1;
         _loc23_.yAdjust = -8;
         _loc23_.axeCoolDown = 1 * this.framesRate;
         _loc23_.axeRange = 230;
         _loc23_.axeMinRange = 40;
         _loc23_.axeMinDamage = 40;
         _loc23_.axeMaxDamage = 80;
         _loc23_.regenerateTime = 5;
         _loc23_.regenerateHealPoints = 2;
         this.enemies.trollAxeThrower = _loc23_;
         var _loc24_:* = new Object();
         _loc24_.className = "EnemyYeti";
         _loc24_.elite = false;
         _loc24_.size = §_-d§;
         _loc24_.isFlying = false;
         _loc24_.health = Math.round(2000 * this.§_-26§);
         _loc24_.armor = 0;
         _loc24_.magicArmor = 0;
         _loc24_.dodge = 0;
         _loc24_.speed = 0.7;
         _loc24_.gold = 120;
         _loc24_.cost = 5;
         _loc24_.attackReloadTime = 2.5 * this.framesRate;
         _loc24_.xSoldierAdjust = 27;
         _loc24_.xAdjust = 0;
         _loc24_.yAdjust = -18;
         _loc24_.minDamage = 50;
         _loc24_.maxDamage = 150;
         _loc24_.areaAttackRangeWidth = 70;
         _loc24_.areaAttackMaxEnemies = 10;
         this.enemies.yeti = _loc24_;
         var _loc25_:* = new Object();
         _loc25_.className = "EnemyYetiBoss";
         _loc25_.elite = false;
         _loc25_.size = §_-d§;
         _loc25_.isFlying = false;
         _loc25_.health = Math.round(11000 * this.§_-26§);
         _loc25_.armor = 0;
         _loc25_.magicArmor = 0;
         _loc25_.dodge = 0;
         _loc25_.speed = 0.4;
         _loc25_.gold = 0;
         _loc25_.cost = 20;
         _loc25_.attackReloadTime = 2 * this.framesRate;
         _loc25_.xSoldierAdjust = 35;
         _loc25_.xAdjust = 0;
         _loc25_.yAdjust = -50;
         _loc25_.breathDuration = 4 * this.framesRate;
         _loc25_.minDamage = 150;
         _loc25_.maxDamage = 200;
         _loc25_.areaDamageAttackRangeWidth = 70;
         _loc25_.areaDamageAttackMaxEnemies = 10;
         _loc25_.areaAttackRangeWidth = 70;
         _loc25_.areaAttackMaxEnemies = 5;
         _loc25_.frozeMaxTowers = 4;
         _loc25_.frozeRangeWidth = 300;
         _loc25_.frozeReloadTime = 10 * this.framesRate;
         _loc25_.maxWolf = 2;
         _loc25_.wolfSpawnCooldownTime = 8 * this.framesRate;
         _loc25_.wolfSpawnInterval = 20;
         _loc25_.maxYetis = 1;
         _loc25_.yetisSpawnCooldownTime = 19 * this.framesRate;
         _loc25_.yetisSpawnInterval = 200;
         this.enemies.yetiBoss = _loc25_;
         var _loc26_:* = new Object();
         _loc26_.className = "EnemySlayer";
         _loc26_.elite = false;
         _loc26_.size = §_-d§;
         _loc26_.isFlying = false;
         _loc26_.health = Math.round(1200 * this.§_-26§);
         _loc26_.armor = 95;
         _loc26_.magicArmor = 0;
         _loc26_.dodge = 0;
         _loc26_.speed = 0.7;
         _loc26_.gold = 100;
         _loc26_.cost = 3;
         _loc26_.minDamage = 24;
         _loc26_.maxDamage = 76;
         _loc26_.attackReloadTime = 1 * this.framesRate;
         _loc26_.xSoldierAdjust = 20;
         _loc26_.xAdjust = 0;
         _loc26_.yAdjust = -18;
         this.enemies.slayer = _loc26_;
         _loc27_ = new Object();
         _loc27_.className = "EnemyRocketeer";
         _loc27_.elite = false;
         _loc27_.size = §_-PP§;
         _loc27_.isFlying = true;
         _loc27_.health = Math.round(340 * this.§_-26§);
         _loc27_.armor = 0;
         _loc27_.magicArmor = 0;
         _loc27_.dodge = 0;
         _loc27_.speed = 1.2;
         _loc27_.gold = 30;
         _loc27_.cost = 1;
         _loc27_.minDamage = 1;
         _loc27_.maxDamage = 2;
         _loc27_.attackReloadTime = 1 * this.framesRate;
         _loc27_.xSoldierAdjust = 15;
         _loc27_.xAdjust = 0;
         _loc27_.yAdjust = -50;
         _loc27_.fastSpeedDuration = 2 * this.framesRate;
         _loc27_.fastSpeed = 4;
         this.enemies.rocketeer = _loc27_;
         _loc28_ = new Object();
         _loc28_.className = "EnemySkeleton";
         _loc28_.elite = false;
         _loc28_.size = §_-PP§;
         _loc28_.isFlying = false;
         _loc28_.health = Math.round(120 * this.§_-26§);
         _loc28_.armor = 0;
         _loc28_.magicArmor = 0;
         _loc28_.dodge = 0;
         _loc28_.speed = 0.6;
         _loc28_.gold = 2;
         _loc28_.cost = 1;
         _loc28_.minDamage = 10;
         _loc28_.maxDamage = 20;
         _loc28_.attackReloadTime = 1 * this.framesRate;
         _loc28_.xSoldierAdjust = 15;
         _loc28_.xAdjust = 0;
         _loc28_.yAdjust = -8;
         this.enemies.skeleton = _loc28_;
         _loc29_ = new Object();
         _loc29_.className = "EnemySkeletonBig";
         _loc29_.elite = false;
         _loc29_.size = §_-d§;
         _loc29_.isFlying = false;
         _loc29_.health = Math.round(400 * this.§_-26§);
         _loc29_.armor = 30;
         _loc29_.magicArmor = 0;
         _loc29_.dodge = 0;
         _loc29_.speed = 0.6;
         _loc29_.gold = 10;
         _loc29_.cost = 1;
         _loc29_.minDamage = 20;
         _loc29_.maxDamage = 40;
         _loc29_.attackReloadTime = 1 * this.framesRate;
         _loc29_.xSoldierAdjust = 18;
         _loc29_.xAdjust = 0;
         _loc29_.yAdjust = -11;
         this.enemies.skeletonBig = _loc29_;
         _loc30_ = new Object();
         _loc30_.className = "EnemyDemonWolf";
         _loc30_.elite = false;
         _loc30_.size = §_-PP§;
         _loc30_.isFlying = false;
         _loc30_.health = Math.round(350 * this.§_-26§);
         _loc30_.armor = 0;
         _loc30_.magicArmor = 60;
         _loc30_.dodge = 50;
         _loc30_.speed = 1.5;
         _loc30_.gold = 25;
         _loc30_.cost = 1;
         _loc30_.minDamage = 20;
         _loc30_.maxDamage = 40;
         _loc30_.attackReloadTime = 1 * this.framesRate;
         _loc30_.xSoldierAdjust = 20;
         _loc30_.xAdjust = 0;
         _loc30_.yAdjust = -8;
         _loc30_.exploteRange = 100;
         _loc30_.exploteMinDamage = 70;
         _loc30_.exploteMaxDamage = 140;
         this.enemies.demonWolf = _loc30_;
         _loc31_ = new Object();
         _loc31_.className = "EnemyDemon";
         _loc31_.elite = false;
         _loc31_.size = §_-PP§;
         _loc31_.isFlying = false;
         _loc31_.health = Math.round(250 * this.§_-26§);
         _loc31_.armor = 0;
         _loc31_.magicArmor = 60;
         _loc31_.dodge = 0;
         _loc31_.speed = 0.8;
         _loc31_.gold = 20;
         _loc31_.cost = 1;
         _loc31_.minDamage = 10;
         _loc31_.maxDamage = 30;
         _loc31_.attackReloadTime = 1 * this.framesRate;
         _loc31_.xSoldierAdjust = 15;
         _loc31_.xAdjust = 0;
         _loc31_.yAdjust = -8;
         _loc31_.exploteRange = 100;
         _loc31_.exploteMinDamage = 50;
         _loc31_.exploteMaxDamage = 100;
         this.enemies.demon = _loc31_;
         _loc32_ = new Object();
         _loc32_.className = "EnemyDemonMage";
         _loc32_.elite = false;
         _loc32_.size = §_-d§;
         _loc32_.isFlying = false;
         _loc32_.health = Math.round(1000 * this.§_-26§);
         _loc32_.armor = 0;
         _loc32_.magicArmor = 60;
         _loc32_.dodge = 0;
         _loc32_.speed = 0.6;
         _loc32_.gold = 60;
         _loc32_.cost = 5;
         _loc32_.minDamage = 15;
         _loc32_.maxDamage = 75;
         _loc32_.attackReloadTime = 1 * this.framesRate;
         _loc32_.xSoldierAdjust = 23;
         _loc32_.xAdjust = 0;
         _loc32_.yAdjust = -18;
         _loc32_.shieldMaxEnemies = 4;
         _loc32_.shieldCoolDown = 6 * this.framesRate;
         _loc32_.shieldIgnoreHits = 4;
         _loc32_.shieldRange = 280;
         _loc32_.exploteRange = 100;
         _loc32_.exploteMinDamage = 200;
         _loc32_.exploteMaxDamage = 400;
         this.enemies.demonMage = _loc32_;
         _loc33_ = new Object();
         _loc33_.className = "EnemyNecromancer";
         _loc33_.elite = false;
         _loc33_.size = §_-PP§;
         _loc33_.isFlying = false;
         _loc33_.health = Math.round(700 * this.§_-26§);
         _loc33_.armor = 0;
         _loc33_.magicArmor = 0;
         _loc33_.dodge = 0;
         _loc33_.speed = 0.6;
         _loc33_.gold = 50;
         _loc33_.cost = 3;
         _loc33_.minDamage = 20;
         _loc33_.maxDamage = 40;
         _loc33_.attackReloadTime = 1 * this.framesRate;
         _loc33_.xSoldierAdjust = 15;
         _loc33_.xAdjust = 0;
         _loc33_.yAdjust = -9;
         _loc33_.summonMaxSkeletons = 35;
         _loc33_.summonMaxEnemies = 4;
         _loc33_.summonCoolDown = 8 * this.framesRate;
         _loc33_.spellCoolDown = 1 * this.framesRate;
         _loc33_.spellRange = 230;
         _loc33_.spellMinRange = 40;
         _loc33_.spellMinDamage = 20;
         _loc33_.spellMaxDamage = 40;
         this.enemies.necromancer = _loc33_;
         _loc34_ = new Object();
         _loc34_.className = "EnemyDemonImp";
         _loc34_.elite = false;
         _loc34_.size = §_-PP§;
         _loc34_.isFlying = true;
         _loc34_.health = Math.round(350 * this.§_-26§);
         _loc34_.armor = 0;
         _loc34_.magicArmor = 0;
         _loc34_.dodge = 0;
         _loc34_.speed = 1;
         _loc34_.gold = 25;
         _loc34_.cost = 1;
         _loc34_.minDamage = 1;
         _loc34_.maxDamage = 2;
         _loc34_.attackReloadTime = 1 * this.framesRate;
         _loc34_.xSoldierAdjust = 15;
         _loc34_.xAdjust = 3;
         _loc34_.yAdjust = -45;
         this.enemies.demonImp = _loc34_;
         _loc35_ = new Object();
         _loc35_.className = "EnemyLavaElemental";
         _loc35_.elite = false;
         _loc35_.size = §_-d§;
         _loc35_.isFlying = false;
         _loc35_.health = Math.round(2500 * this.§_-26§);
         _loc35_.armor = 0;
         _loc35_.magicArmor = 0;
         _loc35_.dodge = 0;
         _loc35_.speed = 0.5;
         _loc35_.gold = 100;
         _loc35_.cost = 5;
         _loc35_.attackReloadTime = 2.5 * this.framesRate;
         _loc35_.xSoldierAdjust = 27;
         _loc35_.xAdjust = 0;
         _loc35_.yAdjust = -18;
         _loc35_.minDamage = 50;
         _loc35_.maxDamage = 150;
         _loc35_.areaAttackRangeWidth = 70;
         _loc35_.areaAttackMaxEnemies = 10;
         this.enemies.lavaElemental = _loc35_;
         _loc36_ = new Object();
         _loc36_.className = "EnemyVeznan";
         _loc36_.elite = false;
         _loc36_.size = §_-d§;
         _loc36_.isFlying = false;
         _loc36_.health = Math.round(6666 * this.§_-26§);
         _loc36_.armor = 0;
         _loc36_.magicArmor = 0;
         _loc36_.dodge = 0;
         _loc36_.speed = 0.4;
         _loc36_.gold = 0;
         _loc36_.cost = 20;
         _loc36_.attackReloadTime = 2 * this.framesRate;
         _loc36_.xSoldierAdjust = 20;
         _loc36_.xAdjust = 0;
         _loc36_.yAdjust = -18;
         _loc36_.demonHealth = 6666;
         _loc36_.demonSpeed = 0.6;
         _loc36_.demonAttackReloadTime = 2.5 * this.framesRate;
         _loc36_.demonXSoldierAdjust = 35;
         _loc36_.demonXAdjust = 0;
         _loc36_.demonYAdjust = -45;
         _loc36_.minDamage = 666;
         _loc36_.maxDamage = 999;
         _loc36_.areaAttackRangeWidth = 120;
         _loc36_.areaAttackMaxEnemies = 8;
         _loc36_.tsungReloadTime = 5 * this.framesRate;
         _loc36_.tsungRangeWidth = 230;
         _loc36_.tsungMinRange = 50;
         _loc36_.tsungMaxEnemies = 5;
         _loc36_.portalTimers = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[15,1,0,0,3],[10,1,0,0,2],[20,0,1,0,3],[15,1,0,0,3],[20,1,1,0,3],[15,1,1,0,3],[15,1,1,0,3],[15,0,0,1,3],[15,1,1,1,3],[15,1,1,1,3]];
         _loc36_.holdTimers = [[0,3],[0,3],[0,3],[0,3],[0,2],[0,2],[0,2],[0,2],[13,2],[13,3],[14,4],[14,5],[16,6],[16,7],[18,8]];
         _loc36_.towerHoldFreeTime = 4 * this.framesRate;
         _loc36_.towerHoldBlockTime = 6 * this.framesRate;
         this.enemies.veznan = _loc36_;
         _loc37_ = new Object();
         _loc37_.className = "EnemyGoblinZapper";
         _loc37_.elite = false;
         _loc37_.size = §_-PP§;
         _loc37_.isFlying = false;
         _loc37_.health = Math.round(140 * this.§_-26§);
         _loc37_.armor = 0;
         _loc37_.magicArmor = 0;
         _loc37_.dodge = 0;
         _loc37_.speed = 1.2;
         _loc37_.gold = 10;
         _loc37_.cost = 1;
         _loc37_.minDamage = 10;
         _loc37_.maxDamage = 20;
         _loc37_.attackReloadTime = 1 * this.framesRate;
         _loc37_.xSoldierAdjust = 15;
         _loc37_.xAdjust = 1;
         _loc37_.yAdjust = -8;
         _loc37_.bombCoolDown = 1 * this.framesRate;
         _loc37_.bombRange = 260;
         _loc37_.bombMinRange = 40;
         _loc37_.bombMinDamage = 30;
         _loc37_.bombMaxDamage = 60;
         _loc37_.exploteRange = 120;
         _loc37_.exploteMinDamage = 50;
         _loc37_.exploteMaxDamage = 150;
         this.enemies.goblinZapper = _loc37_;
         _loc38_ = new Object();
         _loc38_.className = "EnemyForestTroll";
         _loc38_.elite = false;
         _loc38_.size = §_-d§;
         _loc38_.isFlying = false;
         _loc38_.health = Math.round(4000 * this.§_-26§);
         _loc38_.armor = 0;
         _loc38_.magicArmor = 0;
         _loc38_.dodge = 0;
         _loc38_.speed = 0.6;
         _loc38_.gold = 200;
         _loc38_.cost = 5;
         _loc38_.attackReloadTime = 2.5 * this.framesRate;
         _loc38_.xSoldierAdjust = 27;
         _loc38_.xAdjust = 0;
         _loc38_.yAdjust = -18;
         _loc38_.minDamage = 50;
         _loc38_.maxDamage = 150;
         _loc38_.areaAttackRangeWidth = 70;
         _loc38_.areaAttackMaxEnemies = 10;
         _loc38_.regenerateTime = 1;
         _loc38_.regenerateHealPoints = 2;
         this.enemies.forestTroll = _loc38_;
         _loc39_ = new Object();
         _loc39_.className = "EnemyOrcWolfRider";
         _loc39_.elite = false;
         _loc39_.size = MEDIUM;
         _loc39_.isFlying = false;
         _loc39_.health = Math.round(400 * this.§_-26§);
         _loc39_.armor = 0;
         _loc39_.magicArmor = 80;
         _loc39_.dodge = 0;
         _loc39_.speed = 1.4;
         _loc39_.gold = 25;
         _loc39_.cost = 2;
         _loc39_.minDamage = 20;
         _loc39_.maxDamage = 40;
         _loc39_.attackReloadTime = 1 * this.framesRate;
         _loc39_.xSoldierAdjust = 22;
         _loc39_.xAdjust = 0;
         _loc39_.yAdjust = -13;
         this.enemies.orcWolfRider = _loc39_;
         _loc40_ = new Object();
         _loc40_.className = "EnemyOrcArmored";
         _loc40_.elite = false;
         _loc40_.size = MEDIUM;
         _loc40_.isFlying = false;
         _loc40_.health = Math.round(400 * this.§_-26§);
         _loc40_.armor = 80;
         _loc40_.magicArmor = 0;
         _loc40_.dodge = 0;
         _loc40_.speed = 0.8;
         _loc40_.gold = 30;
         _loc40_.cost = 1;
         _loc40_.minDamage = 20;
         _loc40_.maxDamage = 40;
         _loc40_.attackReloadTime = 1 * this.framesRate;
         _loc40_.xSoldierAdjust = 18;
         _loc40_.xAdjust = 0;
         _loc40_.yAdjust = -12;
         this.enemies.orcArmored = _loc40_;
         _loc41_ = new Object();
         _loc41_.className = "EnemyBossGoblinChieftain";
         _loc41_.elite = false;
         _loc41_.size = §_-d§;
         _loc41_.isFlying = false;
         _loc41_.health = Math.round(12000 * this.§_-26§);
         _loc41_.armor = 0;
         _loc41_.magicArmor = 0;
         _loc41_.dodge = 0;
         _loc41_.speed = 0.4;
         _loc41_.gold = 0;
         _loc41_.cost = 20;
         _loc41_.minDamage = 200;
         _loc41_.maxDamage = 600;
         _loc41_.attackReloadTime = 1 * this.framesRate;
         _loc41_.xSoldierAdjust = 42;
         _loc41_.xAdjust = 0;
         _loc41_.yAdjust = -15;
         _loc41_.healMaxEnemies = 20;
         _loc41_.healCoolDown = 8 * this.framesRate;
         _loc41_.healRange = 500;
         _loc41_.healPoints = 200;
         this.enemies.goblinChieftain = _loc41_;
         _loc42_ = new Object();
         _loc42_.className = "EnemyThing";
         _loc42_.elite = false;
         _loc42_.size = §_-d§;
         _loc42_.isFlying = false;
         _loc42_.health = Math.round(3000 * this.§_-26§);
         _loc42_.armor = 0;
         _loc42_.magicArmor = 0;
         _loc42_.dodge = 0;
         _loc42_.speed = 0.6;
         _loc42_.gold = 200;
         _loc42_.cost = 5;
         _loc42_.attackReloadTime = 2.5 * this.framesRate;
         _loc42_.xSoldierAdjust = 27;
         _loc42_.xAdjust = 0;
         _loc42_.yAdjust = -18;
         _loc42_.minDamage = 40;
         _loc42_.maxDamage = 100;
         _loc42_.areaAttackRangeWidth = 70;
         _loc42_.areaAttackMaxEnemies = 10;
         _loc42_.bombCoolDown = 1 * this.framesRate;
         _loc42_.bombRange = 260;
         _loc42_.bombMinRange = 70;
         _loc42_.bombMinDamage = 40;
         _loc42_.bombMaxDamage = 100;
         _loc42_.regenerateTime = 1;
         _loc42_.regenerateHealPoints = 1;
         this.enemies.theThing = _loc42_;
         _loc43_ = new Object();
         _loc43_.className = "EnemyZombie";
         _loc43_.elite = false;
         _loc43_.size = §_-PP§;
         _loc43_.isFlying = false;
         _loc43_.health = Math.round(250 * this.§_-26§);
         _loc43_.armor = 40;
         _loc43_.magicArmor = 0;
         _loc43_.dodge = 0;
         _loc43_.speed = 0.5;
         _loc43_.gold = 10;
         _loc43_.cost = 1;
         _loc43_.minDamage = 5;
         _loc43_.maxDamage = 15;
         _loc43_.attackReloadTime = 1 * this.framesRate;
         _loc43_.xSoldierAdjust = 15;
         _loc43_.xAdjust = 0;
         _loc43_.yAdjust = -8;
         this.enemies.zombie = _loc43_;
         _loc44_ = new Object();
         _loc44_.className = "EnemyRottenTree";
         _loc44_.elite = false;
         _loc44_.size = §_-PP§;
         _loc44_.isFlying = false;
         _loc44_.health = Math.round(1000 * this.§_-26§);
         _loc44_.armor = 80;
         _loc44_.magicArmor = 0;
         _loc44_.dodge = 0;
         _loc44_.speed = 0.6;
         _loc44_.gold = 60;
         _loc44_.cost = 1;
         _loc44_.minDamage = 20;
         _loc44_.maxDamage = 40;
         _loc44_.attackReloadTime = 1 * this.framesRate;
         _loc44_.xSoldierAdjust = 15;
         _loc44_.xAdjust = 0;
         _loc44_.yAdjust = -8;
         this.enemies.rottenTree = _loc44_;
         _loc45_ = new Object();
         _loc45_.className = "EnemyRottenSpider";
         _loc45_.elite = false;
         _loc45_.size = §_-PP§;
         _loc45_.isFlying = false;
         _loc45_.health = Math.round(1000 * this.§_-26§);
         _loc45_.armor = 0;
         _loc45_.magicArmor = 60;
         _loc45_.dodge = 0;
         _loc45_.speed = 0.6;
         _loc45_.gold = 40;
         _loc45_.cost = 3;
         _loc45_.minDamage = 20;
         _loc45_.maxDamage = 40;
         _loc45_.attackReloadTime = 1 * this.framesRate;
         _loc45_.xSoldierAdjust = 24;
         _loc45_.xAdjust = 1;
         _loc45_.yAdjust = -8;
         _loc45_.eggsMax = 6;
         _loc45_.eggsSpiders = 3;
         _loc45_.eggsCooldownTimeMin = 5 * this.framesRate;
         _loc45_.eggsCooldownTimeMax = 10 * this.framesRate;
         this.enemies.rottenSpider = _loc45_;
         _loc46_ = new Object();
         _loc46_.className = "EnemySpiderTinyRotten";
         _loc46_.elite = false;
         _loc46_.size = §_-PP§;
         _loc46_.isFlying = false;
         _loc46_.health = Math.round(80 * this.§_-26§);
         _loc46_.armor = 0;
         _loc46_.magicArmor = 30;
         _loc46_.dodge = 0;
         _loc46_.speed = 1.2;
         _loc46_.gold = 0;
         _loc46_.cost = 1;
         _loc46_.minDamage = 10;
         _loc46_.maxDamage = 20;
         _loc46_.attackReloadTime = 1 * this.framesRate;
         _loc46_.xSoldierAdjust = 14;
         _loc46_.xAdjust = 1;
         _loc46_.yAdjust = -4;
         this.enemies.spiderTinyRotten = _loc46_;
         _loc47_ = new Object();
         _loc47_.className = "EnemyRottenBoss";
         _loc47_.elite = false;
         _loc47_.size = §_-d§;
         _loc47_.isFlying = false;
         _loc47_.health = Math.round(10000 * this.§_-26§);
         _loc47_.armor = 0;
         _loc47_.magicArmor = 0;
         _loc47_.dodge = 0;
         _loc47_.speed = 0.3;
         _loc47_.gold = 0;
         _loc47_.cost = 20;
         _loc47_.attackReloadTime = 2 * this.framesRate;
         _loc47_.xSoldierAdjust = 35;
         _loc47_.xAdjust = 0;
         _loc47_.yAdjust = -30;
         _loc47_.areaAttackRangeWidth = 90;
         _loc47_.minDamage = 150;
         _loc47_.maxDamage = 250;
         _loc47_.areaAttackMaxEnemies = 10;
         _loc47_.bombMaxBalls = 7;
         _loc47_.bombMinDamage = 80;
         _loc47_.bombMaxDamage = 160;
         _loc47_.bombCooldownTime = 6 * this.framesRate;
         this.enemies.rottenBoss = _loc47_;
         _loc48_ = new Object();
         _loc48_.className = "EnemyRaider";
         _loc48_.elite = false;
         _loc48_.size = §_-PP§;
         _loc48_.isFlying = false;
         _loc48_.health = Math.round(1000 * this.§_-26§);
         _loc48_.armor = 95;
         _loc48_.magicArmor = 0;
         _loc48_.dodge = 0;
         _loc48_.speed = 0.8;
         _loc48_.gold = 50;
         _loc48_.cost = 3;
         _loc48_.minDamage = 40;
         _loc48_.maxDamage = 80;
         _loc48_.attackReloadTime = 1 * this.framesRate;
         _loc48_.xSoldierAdjust = 20;
         _loc48_.xAdjust = 0;
         _loc48_.yAdjust = -14;
         _loc48_.bombCoolDown = 1.5 * this.framesRate;
         _loc48_.bombRange = 260;
         _loc48_.bombMinRange = 40;
         _loc48_.bombMinDamage = 80;
         _loc48_.bombMaxDamage = 120;
         this.enemies.raider = _loc48_;
         _loc49_ = new Object();
         _loc49_.className = "EnemyPillager";
         _loc49_.elite = false;
         _loc49_.size = §_-PP§;
         _loc49_.isFlying = false;
         _loc49_.health = Math.round(2800 * this.§_-26§);
         _loc49_.armor = 0;
         _loc49_.magicArmor = 90;
         _loc49_.dodge = 0;
         _loc49_.speed = 0.7;
         _loc49_.gold = 100;
         _loc49_.cost = 5;
         _loc49_.attackReloadTime = 1 * this.framesRate;
         _loc49_.xSoldierAdjust = 28;
         _loc49_.xAdjust = 0;
         _loc49_.yAdjust = -16;
         _loc49_.minDamage = 50;
         _loc49_.maxDamage = 100;
         _loc49_.areaAttackRangeWidth = 70;
         _loc49_.areaAttackMaxEnemies = 10;
         this.enemies.pillager = _loc49_;
         _loc50_ = new Object();
         _loc50_.className = "EnemyBossBandit";
         _loc50_.elite = false;
         _loc50_.size = §_-PP§;
         _loc50_.isFlying = false;
         _loc50_.health = Math.round(8000 * this.§_-26§);
         _loc50_.armor = 0;
         _loc50_.magicArmor = 0;
         _loc50_.dodge = 0;
         _loc50_.speed = 0.4;
         _loc50_.gold = 0;
         _loc50_.cost = 20;
         _loc50_.attackReloadTime = 1 * this.framesRate;
         _loc50_.xSoldierAdjust = 28;
         _loc50_.xAdjust = 0;
         _loc50_.yAdjust = -65;
         _loc50_.areaReloadTime = 1 * this.framesRate;
         _loc50_.minDamage = 80;
         _loc50_.maxDamage = 100;
         _loc50_.areaAttackRangeWidth = 100;
         _loc50_.stopReloadTime = 5 * this.framesRate;
         _loc50_.stopDurationTime = 5 * this.framesRate;
         _loc50_.stopHealPoints = 500;
         _loc50_.stopHealRangeWidth = 200;
         _loc50_.stopHealAlliesPoints = 50;
         this.enemies.bossBandit = _loc50_;
      }
      
      private function §_-Pe§() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         _loc1_ = new Object();
         _loc1_.coolDown = 25 * this.framesRate;
         _loc1_.minDamage = 1;
         _loc1_.maxDamage = 500;
         this.powers.lightning = _loc1_;
         _loc2_ = new Object();
         _loc2_.coolDown = 80 * this.framesRate;
         _loc2_.minDamage = 30;
         _loc2_.maxDamage = 60;
         _loc2_.range = 100;
         _loc2_.scorchedEarthRange = 100;
         _loc2_.scorchedEarthMinDamage = 10;
         _loc2_.scorchedEarthMaxDamage = 20;
         _loc2_.scorchedEarthDamageTime = 1 * this.framesRate;
         _loc2_.scorchedEarthDuration = 5 * this.framesRate;
         _loc2_.blazingEarthRange = 100;
         _loc2_.blazingEarthMinDamage = 20;
         _loc2_.blazingEarthMaxDamage = 30;
         _loc2_.blazingEarthDamageTime = 1 * this.framesRate;
         _loc2_.blazingEarthDuration = 10 * this.framesRate;
         this.powers.fireball = _loc2_;
         _loc3_ = new Object();
         _loc3_.coolDown = 10 * this.framesRate;
         _loc3_.maxSize = §_-d§;
         _loc3_.maxLevel = 5;
         _loc3_.range = 100;
         _loc3_.health = 30;
         _loc3_.armor = 0;
         _loc3_.minDamage = 1;
         _loc3_.maxDamage = 2;
         _loc3_.reload = 1 * this.framesRate;
         _loc3_.lifeTime = 20 * this.framesRate;
         _loc3_.regen = 3;
         _loc3_.regenReload = 1 * this.framesRate;
         this.powers.farmers = _loc3_;
         _loc4_ = new Object();
         _loc4_.range = 100;
         _loc4_.health = 50;
         _loc4_.armor = 0;
         _loc4_.minDamage = 1;
         _loc4_.maxDamage = 3;
         _loc4_.reload = 1 * this.framesRate;
         _loc4_.lifeTime = 20 * this.framesRate;
         _loc4_.regen = 6;
         _loc4_.regenReload = 1 * this.framesRate;
         this.powers.reinforcementLevel1 = _loc4_;
         _loc5_ = new Object();
         _loc5_.coolDown = 10 * this.framesRate;
         _loc5_.maxSize = §_-d§;
         _loc5_.maxLevel = 5;
         _loc5_.range = 100;
         _loc5_.health = 70;
         _loc5_.armor = 10;
         _loc5_.minDamage = 2;
         _loc5_.maxDamage = 4;
         _loc5_.reload = 1 * this.framesRate;
         _loc5_.lifeTime = 20 * this.framesRate;
         _loc5_.regen = 9;
         _loc5_.regenReload = 1 * this.framesRate;
         this.powers.reinforcementLevel2 = _loc5_;
         _loc6_ = new Object();
         _loc6_.coolDown = 10 * this.framesRate;
         _loc6_.maxSize = §_-d§;
         _loc6_.maxLevel = 5;
         _loc6_.range = 100;
         _loc6_.health = 90;
         _loc6_.armor = 20;
         _loc6_.minDamage = 3;
         _loc6_.maxDamage = 6;
         _loc6_.reload = 1 * this.framesRate;
         _loc6_.lifeTime = 20 * this.framesRate;
         _loc6_.regen = 12;
         _loc6_.regenReload = 1 * this.framesRate;
         this.powers.reinforcementLevel3 = _loc6_;
         _loc7_ = new Object();
         _loc7_.coolDown = 10 * this.framesRate;
         _loc7_.maxSize = §_-d§;
         _loc7_.maxLevel = 5;
         _loc7_.range = 100;
         _loc7_.health = 110;
         _loc7_.armor = 30;
         _loc7_.minDamage = 6;
         _loc7_.maxDamage = 10;
         _loc7_.reload = 1 * this.framesRate;
         _loc7_.lifeTime = 20 * this.framesRate;
         _loc7_.regen = 15;
         _loc7_.regenReload = 1 * this.framesRate;
         _loc7_.spearCoolDown = 1 * this.framesRate;
         _loc7_.spearRange = 260;
         _loc7_.spearMinRange = 40;
         _loc7_.spearMinDamage = 24;
         _loc7_.spearMaxDamage = 40;
         this.powers.reinforcementLevel4 = _loc7_;
         _loc8_ = new Object();
         _loc8_.coolDown = 10 * this.framesRate;
         _loc8_.maxSize = §_-d§;
         _loc8_.maxLevel = 5;
         _loc8_.range = 100;
         _loc8_.health = 200;
         _loc8_.armor = 0;
         _loc8_.minDamage = 25;
         _loc8_.maxDamage = 35;
         _loc8_.reload = 1 * this.framesRate;
         _loc8_.lifeTime = 20 * this.framesRate;
         _loc8_.regen = 10;
         _loc8_.regenReload = 1 * this.framesRate;
         this.powers.knights = _loc8_;
      }
      
      private function §_-B2§() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         _loc1_ = new Object();
         _loc1_.max = 4;
         _loc1_.repairCost = 100;
         _loc1_.elfCost = 100;
         _loc1_.maxSize = §_-d§;
         _loc1_.maxLevel = 5;
         _loc1_.range = 80;
         _loc1_.health = 200;
         _loc1_.armor = 0;
         _loc1_.minDamage = 25;
         _loc1_.maxDamage = 50;
         _loc1_.reload = 1 * this.framesRate;
         _loc1_.regen = 20;
         _loc1_.regenReload = 0.5 * this.framesRate;
         _loc1_.arrowCoolDown = 1 * this.framesRate;
         _loc1_.arrowRange = 320;
         _loc1_.arrowMinRange = 40;
         _loc1_.arrowMinDamage = 25;
         _loc1_.arrowMaxDamage = 50;
         this.specials.elves = _loc1_;
         _loc2_ = new Object();
         _loc2_.maxSize = §_-d§;
         _loc2_.maxLevel = 5;
         _loc2_.range = 120;
         _loc2_.health = 250;
         _loc2_.armor = 40;
         _loc2_.minDamage = 10;
         _loc2_.maxDamage = 30;
         _loc2_.reload = 1 * this.framesRate;
         _loc2_.regen = 25;
         _loc2_.regenReload = 1 * this.framesRate;
         this.specials.imperial = _loc2_;
         _loc3_ = new Object();
         _loc3_.max = 1;
         _loc3_.cost = 500;
         _loc3_.rallyRange = 450;
         _loc3_.coolDown = 10 * this.framesRate;
         _loc3_.maxSize = §_-d§;
         _loc3_.maxLevel = 5;
         _loc3_.range = 130;
         _loc3_.health = 2500;
         _loc3_.armor = 0;
         _loc3_.reload = 2.5 * this.framesRate;
         _loc3_.regen = 250;
         _loc3_.regenReload = 1 * this.framesRate;
         _loc3_.areaAttackRangeWidth = 70;
         _loc3_.minDamage = 50;
         _loc3_.maxDamage = 110;
         _loc3_.areaAttackMaxEnemies = 10;
         this.specials.sasquash = _loc3_;
         _loc4_ = new Object();
         _loc4_.mageCost = 100;
         _loc4_.reloadTime = 22 * this.framesRate;
         _loc4_.reloadDecrease = 3 * this.framesRate;
         _loc4_.damageIncrement = 50;
         _loc4_.minDamage = 25;
         _loc4_.maxDamage = 75;
         this.specials.templeTower = _loc4_;
         _loc5_ = new Object();
         _loc5_.limitLifeCondition = 299;
         this.specials.graveyard = _loc5_;
         _loc6_ = new Object();
         _loc6_.spawnTime = 400 * this.framesRate;
         _loc6_.spawnAuxTime = 120 * this.framesRate;
         this.specials.lavaSpawn = _loc6_;
         _loc7_ = new Object();
         _loc7_.spawnTimers = [[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[15,1],[15,1],[15,1],[10,0],[15,2],[15,2],[15,3],[15,3],[15,3],[15,6]];
         this.specials.rottemSpawn = _loc7_;
         _loc8_ = new Object();
         _loc8_.onOffCampaign = [0,0,0,0,1,0,0,1,1,0,0,1,0,1,0,0,1,1,0,1];
         _loc8_.onOffHeroic = [1,1,0,0,1,1];
         this.specials.swampPortal = _loc8_;
         _loc9_ = new Object();
         _loc9_.limitLifeCondition = 400;
         this.specials.swamp = _loc9_;
      }
      
      private function §_-Qc§() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         _loc1_ = new Object();
         _loc1_.masterXp = [0,300,900,2000,4000,8000,12000,16000,20000,26000];
         this.heroes.masterTable = _loc1_;
         _loc2_ = new Object();
         _loc2_.health = [400,420,440,460,480,500,520,540,560,580];
         _loc2_.regen = [100,105,110,115,120,125,130,135,140,145];
         _loc2_.armor = [30,30,40,40,50,50,60,60,70,80];
         _loc2_.minDamage = [11,12,14,15,17,18,20,21,23,24];
         _loc2_.maxDamage = [18,20,23,25,28,30,33,35,38,40];
         _loc2_.size = §_-d§;
         _loc2_.maxLevel = 5;
         _loc2_.reload = 1 * this.framesRate;
         _loc2_.range = 130;
         _loc2_.regenReload = 1 * this.framesRate;
         _loc2_.respawn = 15 * this.framesRate;
         _loc2_.xpMultiplier = 3;
         _loc2_.blockCounterModifier = 2;
         _loc2_.blockCounterMinDamage = 10;
         _loc2_.blockCounterMaxDamage = 20;
         _loc2_.blockCounterDamageReturn = 50;
         _loc2_.blockCounterDamageReturnIncrement = 50;
         _loc2_.blockCounterChance = 0;
         _loc2_.blockCounterChanceIncrement = 20;
         _loc2_.courageModifier = 1;
         _loc2_.courageRangeWidth = 180;
         _loc2_.courageReloadTime = 6;
         _loc2_.courageDurationTime = 6;
         _loc2_.courageHealPercent = 15;
         _loc2_.courageArmor = 0;
         _loc2_.courageArmorIncrement = 5;
         _loc2_.courageDamage = 0;
         _loc2_.courageDamageIncrement = 2;
         _loc2_.stat_health = 8;
         _loc2_.stat_attack = 6;
         _loc2_.stat_range = 0;
         _loc2_.stat_speed = 5;
         _loc2_.localized = "HERO_PALADIN";
         _loc2_.portrait = "0001";
         this.heroes.heroGeneral = _loc2_;
         _loc3_ = new Object();
         _loc3_.health = [450,480,510,540,570,600,630,660,690,720];
         _loc3_.regen = [113,120,128,135,143,150,158,165,173,180];
         _loc3_.armor = [0,10,10,20,20,30,30,40,40,50];
         _loc3_.minDamage = [14,16,18,19,21,22,24,26,27,29];
         _loc3_.maxDamage = [22,24,26,29,31,34,36,38,41,43];
         _loc3_.size = §_-d§;
         _loc3_.maxLevel = 5;
         _loc3_.reload = 1 * this.framesRate;
         _loc3_.range = 130;
         _loc3_.regenReload = 1 * this.framesRate;
         _loc3_.respawn = 15 * this.framesRate;
         _loc3_.xpMultiplier = 1.7;
         _loc3_.smashModifier = 1;
         _loc3_.smashRangeWidth = 120;
         _loc3_.smashReloadTime = 6;
         _loc3_.smashMinDamage = 0;
         _loc3_.smashMaxDamage = 20;
         _loc3_.smashDamageIncrement = 20;
         _loc3_.fissureModifier = 1;
         _loc3_.fissureRangeWidth = 80;
         _loc3_.fissureReloadTime = 14;
         _loc3_.fissureStuntDurationTime = 2;
         _loc3_.fissureMinDamage = 0;
         _loc3_.fissureMaxDamage = 20;
         _loc3_.fissureDamageIncrement = 20;
         _loc3_.stat_health = 8;
         _loc3_.stat_attack = 7;
         _loc3_.stat_range = 0;
         _loc3_.stat_speed = 4;
         _loc3_.localized = "HERO_REINFORCEMENT";
         _loc3_.portrait = "0002";
         this.heroes.heroMalik = _loc3_;
         _loc4_ = new Object();
         _loc4_.health = [250,270,290,310,330,350,370,390,410,430];
         _loc4_.regen = [63,68,73,78,83,88,93,98,103,108];
         _loc4_.armor = [0,0,0,0,0,0,0,0,0,0];
         _loc4_.minDamage = [2,4,6,7,9,10,12,14,15,17];
         _loc4_.maxDamage = [4,6,8,11,13,16,18,20,23,25];
         _loc4_.minRangeDamage = [7,8,9,10,11,12,13,14,14,15];
         _loc4_.maxRangeDamage = [12,14,15,17,18,20,21,23,24,26];
         _loc4_.size = §_-d§;
         _loc4_.maxLevel = 5;
         _loc4_.reload = 1 * this.framesRate;
         _loc4_.range = 70;
         _loc4_.regenReload = 1 * this.framesRate;
         _loc4_.respawn = 15 * this.framesRate;
         _loc4_.xpMultiplier = 2.5;
         _loc4_.rangeShootRangeWidth = 290;
         _loc4_.rangeShootReloadTime = 0.6;
         _loc4_.rangeShootMinDistance = 30;
         _loc4_.multiShootModifier = 0.5;
         _loc4_.multiShootRangeWidthNear = 150;
         _loc4_.multiShootReloadTime = 3;
         _loc4_.multiShootArrows = 1;
         _loc4_.multiShootArrowsIncrement = 1;
         _loc4_.callOfWildModifier = 1;
         _loc4_.callOfWildReloadTime = 20;
         _loc4_.callOfWildSize = §_-d§;
         _loc4_.callOfWildMaxLevel = 5;
         _loc4_.callOfWildRangeRally = 200;
         _loc4_.callOfWildRange = 200;
         _loc4_.callOfWildHealth = 0;
         _loc4_.callOfWildHealthIncrement = 250;
         _loc4_.callOfWildArmor = 0;
         _loc4_.callOfWildMinDamage = 2;
         _loc4_.callOfWildMaxDamage = 4;
         _loc4_.callOfWildDamageIncrement = 4;
         _loc4_.callOfWildReload = 1 * this.framesRate;
         _loc4_.callOfWildRespawn = 10 * this.framesRate;
         _loc4_.callOfWildRegen = 75;
         _loc4_.callOfWildRegenReload = 1 * this.framesRate;
         _loc4_.stat_health = 3;
         _loc4_.stat_attack = 3;
         _loc4_.stat_range = 6;
         _loc4_.stat_speed = 6;
         _loc4_.localized = "HERO_ARCHER";
         _loc4_.portrait = "0003";
         this.heroes.heroArcher = _loc4_;
         _loc5_ = new Object();
         _loc5_.health = [400,430,460,490,520,550,580,610,640,670];
         _loc5_.regen = [100,108,115,123,130,138,145,153,160,168];
         _loc5_.armor = [0,0,0,0,0,0,0,0,0,0];
         _loc5_.minDamage = [9,11,12,14,15,17,18,20,21,23];
         _loc5_.maxDamage = [15,18,20,23,25,28,30,33,35,38];
         _loc5_.minRangeDamage = [9,11,12,14,15,17,18,20,21,23];
         _loc5_.maxRangeDamage = [15,18,20,23,25,28,30,33,35,38];
         _loc5_.size = §_-d§;
         _loc5_.maxLevel = 5;
         _loc5_.reload = 1 * this.framesRate;
         _loc5_.range = 92;
         _loc5_.regenReload = 1 * this.framesRate;
         _loc5_.respawn = 15 * this.framesRate;
         _loc5_.xpMultiplier = 3;
         _loc5_.rangeShootRangeWidth = 240;
         _loc5_.rangeShootReloadTime = 2;
         _loc5_.rangeShootMinDistance = 36;
         _loc5_.rangeShootMaxShoots = 2;
         _loc5_.rangeShootMaxShootsIncrement = 1;
         _loc5_.mineModifier = 0.5;
         _loc5_.mineRangeWidth = 90;
         _loc5_.mineReloadTime = 6;
         _loc5_.mineMax = 10;
         _loc5_.mineMaxIncrement = 20;
         _loc5_.mineActiveRangeWidth = 15;
         _loc5_.mineDuration = 50;
         _loc5_.mineMinDamage = 0;
         _loc5_.mineMaxDamage = 30;
         _loc5_.mineDamageIncrement = 30;
         _loc5_.tarModifier = 1;
         _loc5_.tarRangeWidth = 280;
         _loc5_.tarReloadTime = 14;
         _loc5_.tarDurationTime = 2;
         _loc5_.tarDurationTimeIncrement = 2;
         _loc5_.tarMinDistance = 15;
         _loc5_.tarRangeApplyWidth = 60;
         _loc5_.tarDurationBuffTime = 1;
         _loc5_.stat_health = 6;
         _loc5_.stat_attack = 5;
         _loc5_.stat_range = 5;
         _loc5_.stat_speed = 4;
         _loc5_.localized = "HERO_RIFLEMAN";
         _loc5_.portrait = "0004";
         this.heroes.heroDwarf = _loc5_;
         _loc6_ = new Object();
         _loc6_.health = [170,190,210,230,250,270,290,310,330,350];
         _loc6_.regen = [43,48,53,58,63,68,73,78,83,88];
         _loc6_.armor = [0,0,0,0,0,0,0,0,0,0];
         _loc6_.minDamage = [1,2,2,3,4,5,6,6,7,8];
         _loc6_.maxDamage = [2,4,5,6,7,8,10,11,12,13];
         _loc6_.minRangeDamage = [9,11,12,14,15,17,18,20,21,23];
         _loc6_.maxRangeDamage = [27,32,36,41,45,50,54,59,63,68];
         _loc6_.size = §_-d§;
         _loc6_.maxLevel = 5;
         _loc6_.reload = 1 * this.framesRate;
         _loc6_.range = 70;
         _loc6_.regenReload = 1 * this.framesRate;
         _loc6_.respawn = 15 * this.framesRate;
         _loc6_.xpMultiplier = 2.1;
         _loc6_.rangeShootRangeWidth = 220;
         _loc6_.rangeShootReloadTime = 1;
         _loc6_.rangeShootMinDistance = 36;
         _loc6_.mirageModifier = 1;
         _loc6_.mirageReloadTime = 10;
         _loc6_.mirageIllusions = 0;
         _loc6_.mirageIllusionsIncrement = 1;
         _loc6_.mirageIllusionsHealthPercent = 4;
         _loc6_.mirageIllusionsDamagePercent = 1;
         _loc6_.mirageIllusionsDuration = 10;
         _loc6_.mirageRangeRally = 70;
         _loc6_.mirageRange = 170;
         _loc6_.mirageHealth = 50;
         _loc6_.mirageHealthIncrement = 20;
         _loc6_.mirageArmor = 0;
         _loc6_.mirageMinDamage = 8;
         _loc6_.mirageMaxDamage = 12;
         _loc6_.mirageDamageIncrement = 3;
         _loc6_.mirageReload = 1 * this.framesRate;
         _loc6_.mirageRespawn = 10;
         _loc6_.mirageRegen = 0;
         _loc6_.mirageRegenReload = 1 * this.framesRate;
         _loc6_.lifeTime = 10 * this.framesRate;
         _loc6_.thunderModifier = 1;
         _loc6_.thunderReloadTime = 14;
         _loc6_.thunderProjectilesPerLevel = 6;
         _loc6_.thunderDuration = 2;
         _loc6_.thunderDurationIncrement = 1;
         _loc6_.thunderMinDamage = 20;
         _loc6_.thunderMaxDamage = 20;
         _loc6_.thunderDamageIncrement = 0;
         _loc6_.thunderRangeWidth = 60;
         _loc6_.thunderShootRangeWidth = 280;
         _loc6_.thunderMinDistance = 35;
         _loc6_.stat_health = 2;
         _loc6_.stat_attack = 2;
         _loc6_.stat_range = 8;
         _loc6_.stat_speed = 8;
         _loc6_.localized = "HERO_MAGE";
         _loc6_.portrait = "0005";
         this.heroes.heroMage = _loc6_;
         _loc7_ = new Object();
         _loc7_.health = [400,430,460,490,520,550,580,610,640,670];
         _loc7_.regen = [100,108,115,123,130,138,145,153,160,168];
         _loc7_.armor = [0,0,0,0,0,0,0,0,0,0];
         _loc7_.minDamage = [18,20,21,23,24,26,27,29,30,32];
         _loc7_.maxDamage = [30,33,35,38,40,43,45,48,50,53];
         _loc7_.size = §_-d§;
         _loc7_.maxLevel = 5;
         _loc7_.reload = 1 * this.framesRate;
         _loc7_.range = 90;
         _loc7_.regenReload = 1 * this.framesRate;
         _loc7_.respawn = 12 * this.framesRate;
         _loc7_.xpMultiplier = 2;
         _loc7_.surgeOfFlameModifier = 1;
         _loc7_.surgeOfFlameReloadTime = 4;
         _loc7_.surgeOfFlameRangeWidth = 40;
         _loc7_.surgeOfFlameSpeed = 7;
         _loc7_.surgeOfFlameMinDamage = 0;
         _loc7_.surgeOfFlameMaxDamage = 10;
         _loc7_.surgeOfFlameDamageIncrement = 10;
         _loc7_.surgeOfFlameBlockRangeWidth = 200;
         _loc7_.surgeOfFlameBlockMinDistance = 30;
         _loc7_.flamingFrenzyModifier = 2;
         _loc7_.flamingFrenzyRangeWidth = 150;
         _loc7_.flamingFrenzyMinDamage = 0;
         _loc7_.flamingFrenzyMaxDamage = 10;
         _loc7_.flamingFrenzyDamageIncrement = 20;
         _loc7_.stat_health = 6;
         _loc7_.stat_attack = 8;
         _loc7_.stat_range = 0;
         _loc7_.stat_speed = 6;
         _loc7_.localized = "HERO_FIRE";
         _loc7_.portrait = "0006";
         this.heroes.heroFire = _loc7_;
         _loc8_ = new Object();
         _loc8_.health = [300,320,340,360,380,400,420,440,460,480];
         _loc8_.regen = [75,80,85,90,95,100,105,110,115,120];
         _loc8_.armor = [0,0,0,0,0,0,0,0,0,0];
         _loc8_.minDamage = [11,14,17,20,23,25,28,31,34,37];
         _loc8_.maxDamage = [19,23,28,33,38,42,47,52,56,61];
         _loc8_.size = §_-d§;
         _loc8_.maxLevel = 5;
         _loc8_.reload = 1.5 * this.framesRate;
         _loc8_.range = 70;
         _loc8_.regenReload = 1 * this.framesRate;
         _loc8_.respawn = 15 * this.framesRate;
         _loc8_.xpMultiplier = 2.2;
         _loc8_.rangeShootRangeWidth = 220;
         _loc8_.rangeShootReloadTime = 1.5;
         _loc8_.rangeShootMinDistance = 36;
         _loc8_.buffModifier = 1;
         _loc8_.buffReloadTime = 12;
         _loc8_.buffRangeWidth = 260;
         _loc8_.buffLessReloadPercent = 20;
         _loc8_.buffMoreRangePercent = 20;
         _loc8_.buffDurationTime = 0;
         _loc8_.buffDurationTimeIncrement = 3;
         _loc8_.catapultModifier = 2;
         _loc8_.catapultReloadTime = 10;
         _loc8_.catapultRangeWidth = 260;
         _loc8_.catapultMinRangeWidth = 40;
         _loc8_.catapultMinDamage = 0;
         _loc8_.catapultMaxDamage = 20;
         _loc8_.catapultDamageIncrement = 10;
         _loc8_.catapultRocks = 1;
         _loc8_.catapultRocksIncrement = 2;
         _loc8_.catapultRangeRock = 60;
         _loc8_.stat_health = 5;
         _loc8_.stat_attack = 6;
         _loc8_.stat_range = 6;
         _loc8_.stat_speed = 3;
         _loc8_.localized = "HERO_DENAS";
         _loc8_.portrait = "0007";
         this.heroes.heroKing = _loc8_;
      }
      
      private function §_-q§() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(this.game.gameUpgrades.archersUpEagleEye == true && (this.maxUpgradeLevel == 0 || this.maxUpgradeLevel >= 2))
         {
            _loc1_ = 0.1;
            this.archers.level1.range = this.archers.level1.range + Math.ceil(this.archers.level1.range * _loc1_);
            this.archers.level2.range = this.archers.level2.range + Math.ceil(this.archers.level2.range * _loc1_);
            this.archers.level3.range = this.archers.level3.range + Math.ceil(this.archers.level3.range * _loc1_);
            this.archers.ranger.range = this.archers.ranger.range + Math.ceil(this.archers.ranger.range * _loc1_);
            this.archers.musketeer.range = this.archers.musketeer.range + Math.ceil(this.archers.musketeer.range * _loc1_);
         }
         if(this.game.gameUpgrades.archersUpFarShots == true && (this.maxUpgradeLevel == 0 || this.maxUpgradeLevel >= 4))
         {
            _loc1_ = 0.1;
            this.archers.level1.range = this.archers.level1.range + Math.ceil(this.archers.level1.range * _loc1_);
            this.archers.level2.range = this.archers.level2.range + Math.ceil(this.archers.level2.range * _loc1_);
            this.archers.level3.range = this.archers.level3.range + Math.ceil(this.archers.level3.range * _loc1_);
            this.archers.ranger.range = this.archers.ranger.range + Math.ceil(this.archers.ranger.range * _loc1_);
            this.archers.musketeer.range = this.archers.musketeer.range + Math.ceil(this.archers.musketeer.range * _loc1_);
         }
         if(this.game.gameUpgrades.magesUpSpellReach == true)
         {
            _loc2_ = 0.1;
            this.mages.level1.range = this.mages.level1.range + Math.ceil(this.mages.level1.range * _loc2_);
            this.mages.level2.range = this.mages.level2.range + Math.ceil(this.mages.level2.range * _loc2_);
            this.mages.level3.range = this.mages.level3.range + Math.ceil(this.mages.level3.range * _loc2_);
            this.mages.arcane.range = this.mages.arcane.range + Math.ceil(this.mages.arcane.range * _loc2_);
            this.mages.sorcerer.range = this.mages.sorcerer.range + Math.ceil(this.mages.sorcerer.range * _loc2_);
         }
         if(this.game.gameUpgrades.magesUpEmpoweredMagic == true && (this.maxUpgradeLevel == 0 || this.maxUpgradeLevel >= 4))
         {
            _loc3_ = 0.15;
            this.mages.level1.minDamage = this.mages.level1.minDamage + Math.ceil(this.mages.level1.minDamage * _loc3_);
            this.mages.level1.maxDamage = this.mages.level1.maxDamage + Math.ceil(this.mages.level1.maxDamage * _loc3_);
            this.mages.level2.minDamage = this.mages.level2.minDamage + Math.ceil(this.mages.level2.minDamage * _loc3_);
            this.mages.level2.maxDamage = this.mages.level2.maxDamage + Math.ceil(this.mages.level2.maxDamage * _loc3_);
            this.mages.level3.minDamage = this.mages.level3.minDamage + Math.ceil(this.mages.level3.minDamage * _loc3_);
            this.mages.level3.maxDamage = this.mages.level3.maxDamage + Math.ceil(this.mages.level3.maxDamage * _loc3_);
            this.mages.arcane.minDamage = this.mages.arcane.minDamage + Math.ceil(this.mages.arcane.minDamage * _loc3_);
            this.mages.arcane.maxDamage = this.mages.arcane.maxDamage + Math.ceil(this.mages.arcane.maxDamage * _loc3_);
            this.mages.sorcerer.minDamage = this.mages.sorcerer.minDamage + Math.ceil(this.mages.sorcerer.minDamage * _loc3_);
            this.mages.sorcerer.maxDamage = this.mages.sorcerer.maxDamage + Math.ceil(this.mages.sorcerer.maxDamage * _loc3_);
         }
         if(this.game.gameUpgrades.barracksUpSurvival == true)
         {
            _loc6_ = 0.1;
            if(this.game.gameUpgrades.barracksUpSurvival2 == true && (this.maxUpgradeLevel == 0 || this.maxUpgradeLevel >= 4))
            {
               _loc6_ = 0.2;
            }
            this.soldiers.level1.health = this.soldiers.level1.health + Math.ceil(this.soldiers.level1.health * _loc6_);
            this.soldiers.level2.health = this.soldiers.level2.health + Math.ceil(this.soldiers.level2.health * _loc6_);
            this.soldiers.level3.health = this.soldiers.level3.health + Math.ceil(this.soldiers.level3.health * _loc6_);
            this.soldiers.paladin.health = this.soldiers.paladin.health + Math.ceil(this.soldiers.paladin.health * _loc6_);
            this.soldiers.barbarian.health = this.soldiers.barbarian.health + Math.ceil(this.soldiers.barbarian.health * _loc6_);
         }
         if(this.game.gameUpgrades.barracksUpBetterArmor == true && (this.maxUpgradeLevel == 0 || this.maxUpgradeLevel >= 2))
         {
            _loc7_ = 10;
            this.soldiers.level1.armor = this.soldiers.level1.armor + _loc7_;
            this.soldiers.level2.armor = this.soldiers.level2.armor + _loc7_;
            this.soldiers.level3.armor = this.soldiers.level3.armor + _loc7_;
            this.soldiers.paladin.armor = this.soldiers.paladin.armor + _loc7_;
            this.soldiers.barbarian.armor = this.soldiers.barbarian.armor + _loc7_;
         }
         if(this.game.gameUpgrades.barracksUpImprovedDeployment == true && (this.maxUpgradeLevel == 0 || this.maxUpgradeLevel >= 3))
         {
            _loc8_ = 0.2;
            _loc9_ = 0.2;
            this.soldiers.level1.respawn = this.soldiers.level1.respawn - Math.ceil(this.soldiers.level1.respawn * _loc8_);
            this.soldiers.level2.respawn = this.soldiers.level2.respawn - Math.ceil(this.soldiers.level2.respawn * _loc8_);
            this.soldiers.level3.respawn = this.soldiers.level3.respawn - Math.ceil(this.soldiers.level3.respawn * _loc8_);
            this.soldiers.paladin.respawn = this.soldiers.paladin.respawn - Math.ceil(this.soldiers.paladin.respawn * _loc8_);
            this.soldiers.barbarian.respawn = this.soldiers.barbarian.respawn - Math.ceil(this.soldiers.barbarian.respawn * _loc8_);
            this.soldiers.level1.rangeRally = this.soldiers.level1.rangeRally + Math.ceil(this.soldiers.level1.rangeRally * _loc9_);
            this.soldiers.level2.rangeRally = this.soldiers.level2.rangeRally + Math.ceil(this.soldiers.level2.rangeRally * _loc9_);
            this.soldiers.level3.rangeRally = this.soldiers.level3.rangeRally + Math.ceil(this.soldiers.level3.rangeRally * _loc9_);
            this.soldiers.paladin.rangeRally = this.soldiers.paladin.rangeRally + Math.ceil(this.soldiers.paladin.rangeRally * _loc9_);
            this.soldiers.barbarian.rangeRally = this.soldiers.barbarian.rangeRally + Math.ceil(this.soldiers.barbarian.rangeRally * _loc9_);
         }
         if(this.game.gameUpgrades.engineersUpConcentratedFire == true)
         {
            _loc4_ = 0.1;
            this.engineers.level1.minDamage = this.engineers.level1.minDamage + Math.ceil(this.engineers.level1.minDamage * _loc4_);
            this.engineers.level1.maxDamage = this.engineers.level1.maxDamage + Math.ceil(this.engineers.level1.maxDamage * _loc4_);
            this.engineers.level2.minDamage = this.engineers.level2.minDamage + Math.ceil(this.engineers.level2.minDamage * _loc4_);
            this.engineers.level2.maxDamage = this.engineers.level2.maxDamage + Math.ceil(this.engineers.level2.maxDamage * _loc4_);
            this.engineers.level3.minDamage = this.engineers.level3.minDamage + Math.ceil(this.engineers.level3.minDamage * _loc4_);
            this.engineers.level3.maxDamage = this.engineers.level3.maxDamage + Math.ceil(this.engineers.level3.maxDamage * _loc4_);
            this.engineers.bfg.minDamage = this.engineers.bfg.minDamage + Math.ceil(this.engineers.bfg.minDamage * _loc4_);
            this.engineers.bfg.maxDamage = this.engineers.bfg.maxDamage + Math.ceil(this.engineers.bfg.maxDamage * _loc4_);
            this.engineers.tesla.minDamage = this.engineers.tesla.minDamage + Math.ceil(this.engineers.tesla.minDamage * _loc4_);
            this.engineers.tesla.maxDamage = this.engineers.tesla.maxDamage + Math.ceil(this.engineers.tesla.maxDamage * _loc4_);
         }
         if(this.game.gameUpgrades.engineersUpRangeFinder == true && (this.maxUpgradeLevel == 0 || this.maxUpgradeLevel >= 2))
         {
            _loc5_ = 0.1;
            this.engineers.level1.range = this.engineers.level1.range + Math.ceil(this.engineers.level1.range * _loc5_);
            this.engineers.level2.range = this.engineers.level2.range + Math.ceil(this.engineers.level2.range * _loc5_);
            this.engineers.level3.range = this.engineers.level3.range + Math.ceil(this.engineers.level3.range * _loc5_);
            this.engineers.bfg.range = this.engineers.bfg.range + Math.ceil(this.engineers.bfg.range * _loc5_);
            this.engineers.tesla.range = this.engineers.tesla.range + Math.ceil(this.engineers.tesla.range * _loc5_);
         }
         if(this.game.gameUpgrades.rainUpBlazingSkies == true)
         {
            this.powers.fireball.minDamage = this.powers.fireball.minDamage + 20;
            this.powers.fireball.maxDamage = this.powers.fireball.maxDamage + 20;
         }
         if(this.game.gameUpgrades.rainsUpBiggerAndMeaner == true && (this.maxUpgradeLevel == 0 || this.maxUpgradeLevel >= 3))
         {
            this.powers.fireball.range = this.powers.fireball.range + this.powers.fireball.range * 0.25;
            this.powers.fireball.minDamage = this.powers.fireball.minDamage + 40;
            this.powers.fireball.maxDamage = this.powers.fireball.maxDamage + 40;
            this.powers.fireball.coolDown = this.powers.fireball.coolDown - 10 * this.framesRate;
         }
         if(this.game.gameUpgrades.rainUpBlazingEarth == true && (this.maxUpgradeLevel == 0 || this.maxUpgradeLevel >= 4))
         {
            this.powers.fireball.coolDown = this.powers.fireball.coolDown - 10 * this.framesRate;
         }
         if(this.game.gameUpgrades.rainUpCataclysm == true && (this.maxUpgradeLevel == 0 || this.maxUpgradeLevel == 5))
         {
            this.powers.fireball.minDamage = this.powers.fireball.minDamage + 60;
            this.powers.fireball.maxDamage = this.powers.fireball.maxDamage + 60;
         }
         if(this.game.gameUpgrades.reinforcementLevel == 1)
         {
            this.powers.farmers.range = this.powers.reinforcementLevel1.range;
            this.powers.farmers.health = this.powers.reinforcementLevel1.health;
            this.powers.farmers.armor = this.powers.reinforcementLevel1.armor;
            this.powers.farmers.minDamage = this.powers.reinforcementLevel1.minDamage;
            this.powers.farmers.maxDamage = this.powers.reinforcementLevel1.maxDamage;
            this.powers.farmers.reload = this.powers.reinforcementLevel1.reload;
            this.powers.farmers.lifeTime = this.powers.reinforcementLevel1.lifeTime;
            this.powers.farmers.regen = this.powers.reinforcementLevel1.regen;
            this.powers.farmers.regenReload = this.powers.reinforcementLevel1.regenReload;
         }
      }
      
      public function getArmorString(param1:Number) : String
      {
         if(param1 == 0)
         {
            return Locale.loadStringEx("C_ARMOR_0",Locale.getDefaultLang());
         }
         if(param1 >= 1 && param1 <= 30)
         {
            return Locale.loadStringEx("C_ARMOR_1",Locale.getDefaultLang());
         }
         if(param1 >= 31 && param1 <= 60)
         {
            return Locale.loadStringEx("C_ARMOR_2",Locale.getDefaultLang());
         }
         if(param1 >= 61 && param1 <= 90)
         {
            return Locale.loadStringEx("C_ARMOR_3",Locale.getDefaultLang());
         }
         if(param1 >= 90)
         {
            return Locale.loadStringEx("C_ARMOR_4",Locale.getDefaultLang());
         }
         return "";
      }
      
      public function getSpeedString(param1:Number) : String
      {
         if(param1 >= 0 && param1 <= 0.7)
         {
            return Locale.loadStringEx("C_SPEED_0",Locale.getDefaultLang());
         }
         if(param1 > 0.7 && param1 < 1.5)
         {
            return Locale.loadStringEx("C_SPEED_1",Locale.getDefaultLang());
         }
         if(param1 >= 1.5)
         {
            return Locale.loadStringEx("C_SPEED_2",Locale.getDefaultLang());
         }
         return "";
      }
      
      public function getReloadString(param1:Number) : String
      {
         if(param1 >= 0 && param1 < 0.5)
         {
            return Locale.loadStringEx("C_RELOAD_4",Locale.getDefaultLang());
         }
         if(param1 >= 0.5 && param1 < 0.8)
         {
            return Locale.loadStringEx("C_RELOAD_3",Locale.getDefaultLang());
         }
         if(param1 >= 0.8 && param1 < 1.5)
         {
            return Locale.loadStringEx("C_RELOAD_2",Locale.getDefaultLang());
         }
         if(param1 >= 1.5 && param1 < 2)
         {
            return Locale.loadStringEx("C_RELOAD_1",Locale.getDefaultLang());
         }
         if(param1 >= 2)
         {
            return Locale.loadStringEx("C_RELOAD_0",Locale.getDefaultLang());
         }
         return "";
      }
      
      public function getRangeString(param1:Number) : String
      {
         if(param1 >= 0 && param1 < 250)
         {
            return Locale.loadStringEx("C_RANGE_0",Locale.getDefaultLang());
         }
         if(param1 >= 250 && param1 < 280)
         {
            return Locale.loadStringEx("C_RANGE_1",Locale.getDefaultLang());
         }
         if(param1 >= 280 && param1 < 310)
         {
            return Locale.loadStringEx("C_RANGE_2",Locale.getDefaultLang());
         }
         if(param1 >= 310 && param1 < 360)
         {
            return Locale.loadStringEx("C_RANGE_3",Locale.getDefaultLang());
         }
         if(param1 >= 360)
         {
            return Locale.loadStringEx("C_RANGE_4",Locale.getDefaultLang());
         }
         return "";
      }
      
      public function destroyThis() : void
      {
         this.mages = null;
         this.archers = null;
         this.engineers = null;
         this.soldiers = null;
         this.powers = null;
         this.enemies = null;
         this.specials = null;
         this.heroes = null;
         this.game = null;
      }
   }
}
