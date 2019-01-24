package
{
   import flash.net.SharedObject;
   
   public class GameUpgrades
   {
       
      
      public var archersUpLevel:int = 0;
      
      public var archersUpSalvage:Boolean = false;
      
      public var archersUpEagleEye:Boolean = false;
      
      public var archersUpPiercing:Boolean = false;
      
      public var archersUpFarShots:Boolean = false;
      
      public var archersUpPrecision:Boolean = false;
      
      public var barracksUpLevel:int = 0;
      
      public var barracksUpSurvival:Boolean = false;
      
      public var barracksUpBetterArmor:Boolean = false;
      
      public var barracksUpImprovedDeployment:Boolean = false;
      
      public var barracksUpBarbedArmor:Boolean = false;
      
      public var barracksUpSurvival2:Boolean = false;
      
      public var magesUpLevel:int = 0;
      
      public var magesUpSpellReach:Boolean = false;
      
      public var magesUpArcaneShatter:Boolean = false;
      
      public var magesUpHermeticStudy:Boolean = false;
      
      public var magesUpEmpoweredMagic:Boolean = false;
      
      public var magesUpSlowCurse:Boolean = false;
      
      public var magesUpArcaneShatterDamage:int = 3;
      
      public var engineersUpLevel:int = 0;
      
      public var engineersUpConcentratedFire:Boolean = false;
      
      public var engineersUpRangeFinder:Boolean = false;
      
      public var engineersUpFieldLogistics:Boolean = false;
      
      public var engineersUpIndustrialization:Boolean = false;
      
      public var engineersUpEfficiency:Boolean = false;
      
      public var rainUpLevel:int = 0;
      
      public var rainUpBlazingSkies:Boolean = false;
      
      public var rainUpScorchedEarth:Boolean = false;
      
      public var rainsUpBiggerAndMeaner:Boolean = false;
      
      public var rainUpBlazingEarth:Boolean = false;
      
      public var rainUpCataclysm:Boolean = false;
      
      public var reinforcementLevel:int = 0;
      
      public var heroRoomEnabled:Boolean = false;
      
      public var selectedHero:int = 0;
      
      public var § true§:int = 15;
      
      public var game:Game;
      
      public function GameUpgrades(param1:Game)
      {
         super();
         this.game = param1;
      }
      
      public function reset() : void
      {
         this.archersUpLevel = 0;
         this.archersUpSalvage = false;
         this.archersUpEagleEye = false;
         this.archersUpPiercing = false;
         this.archersUpFarShots = false;
         this.archersUpPrecision = false;
         this.barracksUpLevel = 0;
         this.barracksUpSurvival = false;
         this.barracksUpBetterArmor = false;
         this.barracksUpImprovedDeployment = false;
         this.barracksUpBarbedArmor = false;
         this.barracksUpSurvival2 = false;
         this.magesUpLevel = 0;
         this.magesUpSpellReach = false;
         this.magesUpArcaneShatter = false;
         this.magesUpHermeticStudy = false;
         this.magesUpEmpoweredMagic = false;
         this.magesUpSlowCurse = false;
         this.engineersUpLevel = 0;
         this.engineersUpConcentratedFire = false;
         this.engineersUpRangeFinder = false;
         this.engineersUpFieldLogistics = false;
         this.engineersUpIndustrialization = false;
         this.engineersUpEfficiency = false;
         this.rainUpLevel = 0;
         this.rainUpBlazingSkies = false;
         this.rainUpScorchedEarth = false;
         this.rainsUpBiggerAndMeaner = false;
         this.rainUpBlazingEarth = false;
         this.rainUpCataclysm = false;
         this.reinforcementLevel = 0;
      }
      
      public function buyUpgrade(param1:String) : void
      {
         switch(param1)
         {
            case "archersUpSalvage":
               this.archersUpLevel = 1;
               this.archersUpSalvage = true;
               break;
            case "archersUpEagleEye":
               this.archersUpLevel = 2;
               this.archersUpEagleEye = true;
               break;
            case "archersUpPiercing":
               this.archersUpLevel = 3;
               this.archersUpPiercing = true;
               break;
            case "archersUpFarShots":
               this.archersUpLevel = 4;
               this.archersUpFarShots = true;
               break;
            case "archersUpPrecision":
               this.archersUpLevel = 5;
               this.archersUpPrecision = true;
               break;
            case "barracksUpSurvival":
               this.barracksUpLevel = 1;
               this.barracksUpSurvival = true;
               break;
            case "barracksUpBetterArmor":
               this.barracksUpLevel = 2;
               this.barracksUpBetterArmor = true;
               break;
            case "barracksUpImprovedDeployment":
               this.barracksUpLevel = 3;
               this.barracksUpImprovedDeployment = true;
               break;
            case "barracksUpSurvival2":
               this.barracksUpLevel = 4;
               this.barracksUpSurvival2 = true;
               break;
            case "barracksUpBarbedArmor":
               this.barracksUpLevel = 5;
               this.barracksUpBarbedArmor = true;
               break;
            case "magesUpSpellReach":
               this.magesUpLevel = 1;
               this.magesUpSpellReach = true;
               break;
            case "magesUpArcaneShatter":
               this.magesUpLevel = 2;
               this.magesUpArcaneShatter = true;
               break;
            case "magesUpHermeticStudy":
               this.magesUpLevel = 3;
               this.magesUpHermeticStudy = true;
               break;
            case "magesUpEmpoweredMagic":
               this.magesUpLevel = 4;
               this.magesUpEmpoweredMagic = true;
               break;
            case "magesUpSlowCurse":
               this.magesUpLevel = 5;
               this.magesUpSlowCurse = true;
               break;
            case "engineersUpConcentratedFire":
               this.engineersUpLevel = 1;
               this.engineersUpConcentratedFire = true;
               break;
            case "engineersUpRangeFinder":
               this.engineersUpLevel = 2;
               this.engineersUpRangeFinder = true;
               break;
            case "engineersUpFieldLogistics":
               this.engineersUpLevel = 3;
               this.engineersUpFieldLogistics = true;
               break;
            case "engineersUpIndustrialization":
               this.engineersUpLevel = 4;
               this.engineersUpIndustrialization = true;
               break;
            case "engineersUpEfficiency":
               this.engineersUpLevel = 5;
               this.engineersUpEfficiency = true;
               break;
            case "rainUpBlazingSkies":
               this.rainUpLevel = 1;
               this.rainUpBlazingSkies = true;
               break;
            case "rainUpScorchedEarth":
               this.rainUpLevel = 2;
               this.rainUpScorchedEarth = true;
               break;
            case "rainsUpBiggerAndMeaner":
               this.rainUpLevel = 3;
               this.rainsUpBiggerAndMeaner = true;
               break;
            case "rainUpBlazingEarth":
               this.rainUpLevel = 4;
               this.rainUpBlazingEarth = true;
               break;
            case "rainUpCataclysm":
               this.rainUpLevel = 5;
               this.rainUpCataclysm = true;
               break;
            case "reinforcementLevel1":
               this.reinforcementLevel = 1;
               break;
            case "reinforcementLevel2":
               this.reinforcementLevel = 2;
               break;
            case "reinforcementLevel3":
               this.reinforcementLevel = 3;
               break;
            case "reinforcementLevel4":
               this.reinforcementLevel = 4;
               break;
            case "reinforcementLevel5":
               this.reinforcementLevel = 5;
         }
      }
      
      public function undoUpgrade(param1:String) : void
      {
         switch(param1)
         {
            case "archersUpSalvage":
               this.archersUpLevel = 0;
               this.archersUpSalvage = false;
               break;
            case "archersUpEagleEye":
               this.archersUpLevel = 1;
               this.archersUpEagleEye = false;
               break;
            case "archersUpPiercing":
               this.archersUpLevel = 2;
               this.archersUpPiercing = false;
               break;
            case "archersUpFarShots":
               this.archersUpLevel = 3;
               this.archersUpFarShots = false;
               break;
            case "archersUpPrecision":
               this.archersUpLevel = 4;
               this.archersUpPrecision = false;
               break;
            case "barracksUpSurvival":
               this.barracksUpLevel = 0;
               this.barracksUpSurvival = false;
               break;
            case "barracksUpBetterArmor":
               this.barracksUpLevel = 1;
               this.barracksUpBetterArmor = false;
               break;
            case "barracksUpImprovedDeployment":
               this.barracksUpLevel = 2;
               this.barracksUpImprovedDeployment = false;
               break;
            case "barracksUpSurvival2":
               this.barracksUpLevel = 3;
               this.barracksUpSurvival2 = false;
               break;
            case "barracksUpBarbedArmor":
               this.barracksUpLevel = 4;
               this.barracksUpBarbedArmor = false;
               break;
            case "magesUpSpellReach":
               this.magesUpLevel = 0;
               this.magesUpSpellReach = false;
               break;
            case "magesUpArcaneShatter":
               this.magesUpLevel = 1;
               this.magesUpArcaneShatter = false;
               break;
            case "magesUpHermeticStudy":
               this.magesUpLevel = 2;
               this.magesUpHermeticStudy = false;
               break;
            case "magesUpEmpoweredMagic":
               this.magesUpLevel = 3;
               this.magesUpEmpoweredMagic = false;
               break;
            case "magesUpSlowCurse":
               this.magesUpLevel = 4;
               this.magesUpSlowCurse = false;
               break;
            case "engineersUpConcentratedFire":
               this.engineersUpLevel = 0;
               this.engineersUpConcentratedFire = false;
               break;
            case "engineersUpRangeFinder":
               this.engineersUpLevel = 1;
               this.engineersUpRangeFinder = false;
               break;
            case "engineersUpFieldLogistics":
               this.engineersUpLevel = 2;
               this.engineersUpFieldLogistics = false;
               break;
            case "engineersUpIndustrialization":
               this.engineersUpLevel = 3;
               this.engineersUpIndustrialization = false;
               break;
            case "engineersUpEfficiency":
               this.engineersUpLevel = 4;
               this.engineersUpEfficiency = false;
               break;
            case "rainUpBlazingSkies":
               this.rainUpLevel = 0;
               this.rainUpBlazingSkies = false;
               break;
            case "rainUpScorchedEarth":
               this.rainUpLevel = 1;
               this.rainUpScorchedEarth = false;
               break;
            case "rainsUpBiggerAndMeaner":
               this.rainUpLevel = 2;
               this.rainsUpBiggerAndMeaner = false;
               break;
            case "rainUpBlazingEarth":
               this.rainUpLevel = 3;
               this.rainUpBlazingEarth = false;
               break;
            case "rainUpCataclysm":
               this.rainUpLevel = 4;
               this.rainUpCataclysm = false;
               break;
            case "reinforcementLevel1":
               this.reinforcementLevel = 0;
               break;
            case "reinforcementLevel2":
               this.reinforcementLevel = 1;
               break;
            case "reinforcementLevel3":
               this.reinforcementLevel = 2;
               break;
            case "reinforcementLevel4":
               this.reinforcementLevel = 3;
               break;
            case "reinforcementLevel5":
               this.reinforcementLevel = 4;
         }
      }
      
      public function saveData() : void
      {
         var my_so:SharedObject = null;
         if(!this.game.§_-Pd§)
         {
            try
            {
               my_so = SharedObject.getLocal(this.game.selectedSlot);
               my_so.data.upgrades.archersUpLevel = this.archersUpLevel;
               my_so.data.upgrades.archersUpSalvage = this.archersUpSalvage;
               my_so.data.upgrades.archersUpEagleEye = this.archersUpEagleEye;
               my_so.data.upgrades.archersUpPiercing = this.archersUpPiercing;
               my_so.data.upgrades.archersUpFarShots = this.archersUpFarShots;
               my_so.data.upgrades.archersUpPrecision = this.archersUpPrecision;
               my_so.data.upgrades.barracksUpLevel = this.barracksUpLevel;
               my_so.data.upgrades.barracksUpSurvival = this.barracksUpSurvival;
               my_so.data.upgrades.barracksUpBetterArmor = this.barracksUpBetterArmor;
               my_so.data.upgrades.barracksUpImprovedDeployment = this.barracksUpImprovedDeployment;
               my_so.data.upgrades.barracksUpBarbedArmor = this.barracksUpBarbedArmor;
               my_so.data.upgrades.barracksUpSurvival2 = this.barracksUpSurvival2;
               my_so.data.upgrades.magesUpLevel = this.magesUpLevel;
               my_so.data.upgrades.magesUpSpellReach = this.magesUpSpellReach;
               my_so.data.upgrades.magesUpArcaneShatter = this.magesUpArcaneShatter;
               my_so.data.upgrades.magesUpHermeticStudy = this.magesUpHermeticStudy;
               my_so.data.upgrades.magesUpEmpoweredMagic = this.magesUpEmpoweredMagic;
               my_so.data.upgrades.magesUpSlowCurse = this.magesUpSlowCurse;
               my_so.data.upgrades.engineersUpLevel = this.engineersUpLevel;
               my_so.data.upgrades.engineersUpConcentratedFire = this.engineersUpConcentratedFire;
               my_so.data.upgrades.engineersUpRangeFinder = this.engineersUpRangeFinder;
               my_so.data.upgrades.engineersUpFieldLogistics = this.engineersUpFieldLogistics;
               my_so.data.upgrades.engineersUpIndustrialization = this.engineersUpIndustrialization;
               my_so.data.upgrades.engineersUpEfficiency = this.engineersUpEfficiency;
               my_so.data.upgrades.rainUpLevel = this.rainUpLevel;
               my_so.data.upgrades.rainUpBlazingSkies = this.rainUpBlazingSkies;
               my_so.data.upgrades.rainUpScorchedEarth = this.rainUpScorchedEarth;
               my_so.data.upgrades.rainsUpBiggerAndMeaner = this.rainsUpBiggerAndMeaner;
               my_so.data.upgrades.rainUpBlazingEarth = this.rainUpBlazingEarth;
               my_so.data.upgrades.rainUpCataclysm = this.rainUpCataclysm;
               my_so.data.upgrades.reinforcementLevel = this.reinforcementLevel;
               my_so.data.upgrades.heroRoomEnabled = this.heroRoomEnabled;
               my_so.data.upgrades.selectedHero = this.selectedHero;
               my_so.flush();
               my_so.close();
               return;
            }
            catch(err:Error)
            {
               return;
            }
         }
      }
      
      public function loadData() : void
      {
         var my_so:SharedObject = null;
         try
         {
            my_so = SharedObject.getLocal(this.game.selectedSlot);
            this.archersUpLevel = my_so.data.upgrades.archersUpLevel;
            this.archersUpSalvage = my_so.data.upgrades.archersUpSalvage;
            this.archersUpEagleEye = my_so.data.upgrades.archersUpEagleEye;
            this.archersUpPiercing = my_so.data.upgrades.archersUpPiercing;
            this.archersUpFarShots = my_so.data.upgrades.archersUpFarShots;
            this.archersUpPrecision = my_so.data.upgrades.archersUpPrecision;
            this.barracksUpLevel = my_so.data.upgrades.barracksUpLevel;
            this.barracksUpSurvival = my_so.data.upgrades.barracksUpSurvival;
            this.barracksUpBetterArmor = my_so.data.upgrades.barracksUpBetterArmor;
            this.barracksUpImprovedDeployment = my_so.data.upgrades.barracksUpImprovedDeployment;
            this.barracksUpBarbedArmor = my_so.data.upgrades.barracksUpBarbedArmor;
            this.barracksUpSurvival2 = my_so.data.upgrades.barracksUpSurvival2;
            this.magesUpLevel = my_so.data.upgrades.magesUpLevel;
            this.magesUpSpellReach = my_so.data.upgrades.magesUpSpellReach;
            this.magesUpArcaneShatter = my_so.data.upgrades.magesUpArcaneShatter;
            this.magesUpHermeticStudy = my_so.data.upgrades.magesUpHermeticStudy;
            this.magesUpEmpoweredMagic = my_so.data.upgrades.magesUpEmpoweredMagic;
            this.magesUpSlowCurse = my_so.data.upgrades.magesUpSlowCurse;
            this.engineersUpLevel = my_so.data.upgrades.engineersUpLevel;
            this.engineersUpConcentratedFire = my_so.data.upgrades.engineersUpConcentratedFire;
            this.engineersUpRangeFinder = my_so.data.upgrades.engineersUpRangeFinder;
            this.engineersUpFieldLogistics = my_so.data.upgrades.engineersUpFieldLogistics;
            this.engineersUpIndustrialization = my_so.data.upgrades.engineersUpIndustrialization;
            this.engineersUpEfficiency = my_so.data.upgrades.engineersUpEfficiency;
            this.rainUpLevel = my_so.data.upgrades.rainUpLevel;
            this.rainUpBlazingSkies = my_so.data.upgrades.rainUpBlazingSkies;
            this.rainUpScorchedEarth = my_so.data.upgrades.rainUpScorchedEarth;
            this.rainsUpBiggerAndMeaner = my_so.data.upgrades.rainsUpBiggerAndMeaner;
            this.rainUpBlazingEarth = my_so.data.upgrades.rainUpBlazingEarth;
            this.rainUpCataclysm = my_so.data.upgrades.rainUpCataclysm;
            this.reinforcementLevel = my_so.data.upgrades.reinforcementLevel;
            this.heroRoomEnabled = my_so.data.upgrades.heroRoomEnabled;
            this.selectedHero = my_so.data.upgrades.selectedHero;
            my_so.flush();
            my_so.close();
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      public function loadFromObject(param1:Object) : void
      {
         this.archersUpLevel = param1.archersUpLevel;
         this.archersUpSalvage = param1.archersUpSalvage;
         this.archersUpEagleEye = param1.archersUpEagleEye;
         this.archersUpPiercing = param1.archersUpPiercing;
         this.archersUpFarShots = param1.archersUpFarShots;
         this.archersUpPrecision = param1.archersUpPrecision;
         this.barracksUpLevel = param1.barracksUpLevel;
         this.barracksUpSurvival = param1.barracksUpSurvival;
         this.barracksUpBetterArmor = param1.barracksUpBetterArmor;
         this.barracksUpImprovedDeployment = param1.barracksUpImprovedDeployment;
         this.barracksUpBarbedArmor = param1.barracksUpBarbedArmor;
         this.barracksUpSurvival2 = param1.barracksUpSurvival2;
         this.magesUpLevel = param1.magesUpLevel;
         this.magesUpSpellReach = param1.magesUpSpellReach;
         this.magesUpArcaneShatter = param1.magesUpArcaneShatter;
         this.magesUpHermeticStudy = param1.magesUpHermeticStudy;
         this.magesUpEmpoweredMagic = param1.magesUpEmpoweredMagic;
         this.magesUpSlowCurse = param1.magesUpSlowCurse;
         this.engineersUpLevel = param1.engineersUpLevel;
         this.engineersUpConcentratedFire = param1.engineersUpConcentratedFire;
         this.engineersUpRangeFinder = param1.engineersUpRangeFinder;
         this.engineersUpFieldLogistics = param1.engineersUpFieldLogistics;
         this.engineersUpIndustrialization = param1.engineersUpIndustrialization;
         this.engineersUpEfficiency = param1.engineersUpEfficiency;
         this.rainUpLevel = param1.rainUpLevel;
         this.rainUpBlazingSkies = param1.rainUpBlazingSkies;
         this.rainUpScorchedEarth = param1.rainUpScorchedEarth;
         this.rainsUpBiggerAndMeaner = param1.rainsUpBiggerAndMeaner;
         this.rainUpBlazingEarth = param1.rainUpBlazingEarth;
         this.rainUpCataclysm = param1.rainUpCataclysm;
         this.reinforcementLevel = param1.reinforcementLevel;
         this.heroRoomEnabled = param1.heroRoomEnabled;
         this.selectedHero = param1.selectedHero;
      }
      
      public function getUpgradesObject() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.archersUpLevel = this.archersUpLevel;
         _loc1_.archersUpSalvage = this.archersUpSalvage;
         _loc1_.archersUpEagleEye = this.archersUpEagleEye;
         _loc1_.archersUpPiercing = this.archersUpPiercing;
         _loc1_.archersUpFarShots = this.archersUpFarShots;
         _loc1_.archersUpPrecision = this.archersUpPrecision;
         _loc1_.barracksUpLevel = this.barracksUpLevel;
         _loc1_.barracksUpSurvival = this.barracksUpSurvival;
         _loc1_.barracksUpBetterArmor = this.barracksUpBetterArmor;
         _loc1_.barracksUpImprovedDeployment = this.barracksUpImprovedDeployment;
         _loc1_.barracksUpBarbedArmor = this.barracksUpBarbedArmor;
         _loc1_.barracksUpSurvival2 = this.barracksUpSurvival2;
         _loc1_.magesUpLevel = this.magesUpLevel;
         _loc1_.magesUpSpellReach = this.magesUpSpellReach;
         _loc1_.magesUpArcaneShatter = this.magesUpArcaneShatter;
         _loc1_.magesUpHermeticStudy = this.magesUpHermeticStudy;
         _loc1_.magesUpEmpoweredMagic = this.magesUpEmpoweredMagic;
         _loc1_.magesUpSlowCurse = this.magesUpSlowCurse;
         _loc1_.engineersUpLevel = this.engineersUpLevel;
         _loc1_.engineersUpConcentratedFire = this.engineersUpConcentratedFire;
         _loc1_.engineersUpRangeFinder = this.engineersUpRangeFinder;
         _loc1_.engineersUpFieldLogistics = this.engineersUpFieldLogistics;
         _loc1_.engineersUpIndustrialization = this.engineersUpIndustrialization;
         _loc1_.engineersUpEfficiency = this.engineersUpEfficiency;
         _loc1_.rainUpLevel = this.rainUpLevel;
         _loc1_.rainUpBlazingSkies = this.rainUpBlazingSkies;
         _loc1_.rainUpScorchedEarth = this.rainUpScorchedEarth;
         _loc1_.rainsUpBiggerAndMeaner = this.rainsUpBiggerAndMeaner;
         _loc1_.rainUpBlazingEarth = this.rainUpBlazingEarth;
         _loc1_.rainUpCataclysm = this.rainUpCataclysm;
         _loc1_.reinforcementLevel = this.reinforcementLevel;
         _loc1_.heroRoomEnabled = this.heroRoomEnabled;
         _loc1_.selectedHero = this.selectedHero;
         return _loc1_;
      }
      
      public function §_-1j§(param1:int) : void
      {
         this.selectedHero = param1;
      }
      
      public function getHeroStats() : Object
      {
         var _loc1_:GameSettings = new GameSettings(this.game,false,0);
         var _loc2_:Object = new Object();
         var _loc3_:Object = new Object();
         _loc2_.archer = _loc3_;
         _loc2_.archer.stat_health = _loc1_.heroes.heroArcher.stat_health;
         _loc2_.archer.stat_attack = _loc1_.heroes.heroArcher.stat_attack;
         _loc2_.archer.stat_range = _loc1_.heroes.heroArcher.stat_range;
         _loc2_.archer.stat_speed = _loc1_.heroes.heroArcher.stat_speed;
         _loc2_.archer.localized = _loc1_.heroes.heroArcher.localized;
         _loc2_.archer.portrait = _loc1_.heroes.heroArcher.portrait;
         var _loc4_:Object = new Object();
         _loc2_.general = _loc4_;
         _loc2_.general.stat_health = _loc1_.heroes.heroGeneral.stat_health;
         _loc2_.general.stat_attack = _loc1_.heroes.heroGeneral.stat_attack;
         _loc2_.general.stat_range = _loc1_.heroes.heroGeneral.stat_range;
         _loc2_.general.stat_speed = _loc1_.heroes.heroGeneral.stat_speed;
         _loc2_.general.localized = _loc1_.heroes.heroGeneral.localized;
         _loc2_.general.portrait = _loc1_.heroes.heroGeneral.portrait;
         var _loc5_:Object = new Object();
         _loc2_.dwarf = _loc5_;
         _loc2_.dwarf.stat_health = _loc1_.heroes.heroDwarf.stat_health;
         _loc2_.dwarf.stat_attack = _loc1_.heroes.heroDwarf.stat_attack;
         _loc2_.dwarf.stat_range = _loc1_.heroes.heroDwarf.stat_range;
         _loc2_.dwarf.stat_speed = _loc1_.heroes.heroDwarf.stat_speed;
         _loc2_.dwarf.localized = _loc1_.heroes.heroDwarf.localized;
         _loc2_.dwarf.portrait = _loc1_.heroes.heroDwarf.portrait;
         var _loc6_:Object = new Object();
         _loc2_.king = _loc6_;
         _loc2_.king.stat_health = _loc1_.heroes.heroKing.stat_health;
         _loc2_.king.stat_attack = _loc1_.heroes.heroKing.stat_attack;
         _loc2_.king.stat_range = _loc1_.heroes.heroKing.stat_range;
         _loc2_.king.stat_speed = _loc1_.heroes.heroKing.stat_speed;
         _loc2_.king.localized = _loc1_.heroes.heroKing.localized;
         _loc2_.king.portrait = _loc1_.heroes.heroKing.portrait;
         var _loc7_:Object = new Object();
         _loc2_.fire = _loc7_;
         _loc2_.fire.stat_health = _loc1_.heroes.heroFire.stat_health;
         _loc2_.fire.stat_attack = _loc1_.heroes.heroFire.stat_attack;
         _loc2_.fire.stat_range = _loc1_.heroes.heroFire.stat_range;
         _loc2_.fire.stat_speed = _loc1_.heroes.heroFire.stat_speed;
         _loc2_.fire.localized = _loc1_.heroes.heroFire.localized;
         _loc2_.fire.portrait = _loc1_.heroes.heroFire.portrait;
         var _loc8_:Object = new Object();
         _loc2_.mage = _loc8_;
         _loc2_.mage.stat_health = _loc1_.heroes.heroMage.stat_health;
         _loc2_.mage.stat_attack = _loc1_.heroes.heroMage.stat_attack;
         _loc2_.mage.stat_range = _loc1_.heroes.heroMage.stat_range;
         _loc2_.mage.stat_speed = _loc1_.heroes.heroMage.stat_speed;
         _loc2_.mage.localized = _loc1_.heroes.heroMage.localized;
         _loc2_.mage.portrait = _loc1_.heroes.heroMage.portrait;
         var _loc9_:Object = new Object();
         _loc2_.malik = _loc9_;
         _loc2_.malik.stat_health = _loc1_.heroes.heroMalik.stat_health;
         _loc2_.malik.stat_attack = _loc1_.heroes.heroMalik.stat_attack;
         _loc2_.malik.stat_range = _loc1_.heroes.heroMalik.stat_range;
         _loc2_.malik.stat_speed = _loc1_.heroes.heroMalik.stat_speed;
         _loc2_.malik.localized = _loc1_.heroes.heroMalik.localized;
         _loc2_.malik.portrait = _loc1_.heroes.heroMalik.portrait;
         _loc1_.destroyThis();
         return _loc2_;
      }
      
      public function §_-Ih§(param1:int) : Boolean
      {
         if(this.game.pc)
         {
            return true;
         }
         switch(param1)
         {
            case GameSettings.§_-99§:
               return true;
            case GameSettings.§_-PW§:
               return true;
            case GameSettings.§_-Od§:
               return false;
            case GameSettings.HERO_DENAS:
               return false;
            case GameSettings.§_-98§:
               return false;
            case GameSettings.§_-7H§:
               return false;
            case GameSettings.§_-6P§:
               return true;
            default:
               return false;
         }
      }
      
      public function hasAllUpgrades() : Boolean
      {
         if(this.rainUpCataclysm && this.engineersUpEfficiency && this.engineersUpEfficiency && this.magesUpSlowCurse && this.barracksUpSurvival2 && this.archersUpPrecision)
         {
            return true;
         }
         return false;
      }
      
      public function destroyThis() : void
      {
         this.game = null;
      }
   }
}
