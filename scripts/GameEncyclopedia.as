package
{
   import flash.net.SharedObject;
   
   public class GameEncyclopedia
   {
       
      
      public var notificationTowerArchersLevel2:Boolean;
      
      public var notificationTowerArchersLevel3:Boolean;
      
      public var notificationTowerArchersRanger:Boolean;
      
      public var notificationTowerArchersMusketeer:Boolean;
      
      public var notificationTowerSoldiersLevel2:Boolean;
      
      public var notificationTowerSoldiersLevel3:Boolean;
      
      public var notificationTowerSoldiersPaladin:Boolean;
      
      public var notificationTowerSoldiersBarbarian:Boolean;
      
      public var notificationTowerMagesLevel2:Boolean;
      
      public var notificationTowerMagesLevel3:Boolean;
      
      public var notificationTowerMagesArcane:Boolean;
      
      public var notificationTowerMagesSorcerer:Boolean;
      
      public var notificationTowerEngineersLevel2:Boolean;
      
      public var notificationTowerEngineersLevel3:Boolean;
      
      public var notificationTowerEngineersBfg:Boolean;
      
      public var notificationTowerEngineersTesla:Boolean;
      
      public var notificationEnemyGoblin:Boolean;
      
      public var notificationEnemyFatOrc:Boolean;
      
      public var notificationEnemyShaman:Boolean;
      
      public var notificationEnemyOgre:Boolean;
      
      public var notificationEnemyBandit:Boolean;
      
      public var notificationEnemyBrigand:Boolean;
      
      public var notificationEnemyMarauder:Boolean;
      
      public var notificationEnemySpider:Boolean;
      
      public var notificationEnemySpiderSmall:Boolean;
      
      public var notificationEnemyGargoyle:Boolean;
      
      public var notificationEnemyShadowArcher:Boolean;
      
      public var notificationEnemyDarkKnight:Boolean;
      
      public var notificationEnemySmallWolf:Boolean;
      
      public var notificationEnemyWolf:Boolean;
      
      public var notificationEnemyGolemHead:Boolean;
      
      public var notificationEnemyWhiteWolf:Boolean;
      
      public var notificationEnemyTroll:Boolean;
      
      public var notificationEnemyTrollAxeThrower:Boolean;
      
      public var notificationEnemyTrollChieftain:Boolean;
      
      public var notificationEnemyYeti:Boolean;
      
      public var notificationEnemyRocketeer:Boolean;
      
      public var notificationEnemyDarkSlayer:Boolean;
      
      public var notificationEnemyDemon:Boolean;
      
      public var notificationEnemyDemonMage:Boolean;
      
      public var notificationEnemyDemonWolf:Boolean;
      
      public var notificationEnemyDemonImp:Boolean;
      
      public var notificationEnemyNecromancer:Boolean;
      
      public var notificationEnemySkeletor:Boolean;
      
      public var notificationEnemySkeletorBig:Boolean;
      
      public var notificationEnemyLavaElemental:Boolean;
      
      public var notificationEnemyJuggernaut:Boolean;
      
      public var notificationEnemyYetiBoss:Boolean;
      
      public var notificationEnemyVeznan:Boolean;
      
      public var notificationEnemySarelgazSmall:Boolean;
      
      public var notificationEnemySarelgaz:Boolean;
      
      public var notificationEnemyOrcArmored:Boolean;
      
      public var notificationEnemyGoblinZapper:Boolean;
      
      public var notificationEnemyOrcWolfRider:Boolean;
      
      public var notificationEnemyForestTroll:Boolean;
      
      public var notificationEnemyBossGoblinChieftain:Boolean;
      
      public var notificationEnemyZombie:Boolean;
      
      public var notificationEnemyRottenSpider:Boolean;
      
      public var notificationEnemyRottenTree:Boolean;
      
      public var notificationEnemySwampThing:Boolean;
      
      public var notificationEnemyBossGreenmuck:Boolean;
      
      public var notificationEnemyRaider:Boolean;
      
      public var notificationEnemyPillager:Boolean;
      
      public var notificationEnemyBossBandit:Boolean;
      
      private var game:Game;
      
      public function GameEncyclopedia(param1:Game)
      {
         super();
         this.game = param1;
      }
      
      public function saveData() : void
      {
         var my_so:SharedObject = null;
         if(!this.game.§_-Pd§)
         {
            try
            {
               my_so = SharedObject.getLocal(this.game.selectedSlot);
               if(my_so.data.encyclopedia == undefined)
               {
                  my_so.data.encyclopedia = new Object();
               }
               my_so.data.encyclopedia.notificationTowerArchersLevel2 = this.notificationTowerArchersLevel2;
               my_so.data.encyclopedia.notificationTowerArchersLevel3 = this.notificationTowerArchersLevel3;
               my_so.data.encyclopedia.notificationTowerArchersRanger = this.notificationTowerArchersRanger;
               my_so.data.encyclopedia.notificationTowerArchersMusketeer = this.notificationTowerArchersMusketeer;
               my_so.data.encyclopedia.notificationTowerSoldiersLevel2 = this.notificationTowerSoldiersLevel2;
               my_so.data.encyclopedia.notificationTowerSoldiersLevel3 = this.notificationTowerSoldiersLevel3;
               my_so.data.encyclopedia.notificationTowerSoldiersPaladin = this.notificationTowerSoldiersPaladin;
               my_so.data.encyclopedia.notificationTowerSoldiersBarbarian = this.notificationTowerSoldiersBarbarian;
               my_so.data.encyclopedia.notificationTowerMagesLevel2 = this.notificationTowerMagesLevel2;
               my_so.data.encyclopedia.notificationTowerMagesLevel3 = this.notificationTowerMagesLevel3;
               my_so.data.encyclopedia.notificationTowerMagesArcane = this.notificationTowerMagesArcane;
               my_so.data.encyclopedia.notificationTowerMagesSorcerer = this.notificationTowerMagesSorcerer;
               my_so.data.encyclopedia.notificationTowerEngineersLevel2 = this.notificationTowerEngineersLevel2;
               my_so.data.encyclopedia.notificationTowerEngineersLevel3 = this.notificationTowerEngineersLevel3;
               my_so.data.encyclopedia.notificationTowerEngineersBfg = this.notificationTowerEngineersBfg;
               my_so.data.encyclopedia.notificationTowerEngineersTesla = this.notificationTowerEngineersTesla;
               my_so.data.encyclopedia.notificationEnemyGoblin = this.notificationEnemyGoblin;
               my_so.data.encyclopedia.notificationEnemyFatOrc = this.notificationEnemyFatOrc;
               my_so.data.encyclopedia.notificationEnemyShaman = this.notificationEnemyShaman;
               my_so.data.encyclopedia.notificationEnemyOgre = this.notificationEnemyOgre;
               my_so.data.encyclopedia.notificationEnemyBandit = this.notificationEnemyBandit;
               my_so.data.encyclopedia.notificationEnemyBrigand = this.notificationEnemyBrigand;
               my_so.data.encyclopedia.notificationEnemyMarauder = this.notificationEnemyMarauder;
               my_so.data.encyclopedia.notificationEnemySpider = this.notificationEnemySpider;
               my_so.data.encyclopedia.notificationEnemySpiderSmall = this.notificationEnemySpiderSmall;
               my_so.data.encyclopedia.notificationEnemyGargoyle = this.notificationEnemyGargoyle;
               my_so.data.encyclopedia.notificationEnemyShadowArcher = this.notificationEnemyShadowArcher;
               my_so.data.encyclopedia.notificationEnemyDarkKnight = this.notificationEnemyDarkKnight;
               my_so.data.encyclopedia.notificationEnemySmallWolf = this.notificationEnemySmallWolf;
               my_so.data.encyclopedia.notificationEnemyWolf = this.notificationEnemyWolf;
               my_so.data.encyclopedia.notificationEnemyGolemHead = this.notificationEnemyGolemHead;
               my_so.data.encyclopedia.notificationEnemyWhiteWolf = this.notificationEnemyWhiteWolf;
               my_so.data.encyclopedia.notificationEnemyTroll = this.notificationEnemyTroll;
               my_so.data.encyclopedia.notificationEnemyTrollAxeThrower = this.notificationEnemyTrollAxeThrower;
               my_so.data.encyclopedia.notificationEnemyTrollChieftain = this.notificationEnemyTrollChieftain;
               my_so.data.encyclopedia.notificationEnemyYeti = this.notificationEnemyYeti;
               my_so.data.encyclopedia.notificationEnemyRocketeer = this.notificationEnemyRocketeer;
               my_so.data.encyclopedia.notificationEnemyDarkSlayer = this.notificationEnemyDarkSlayer;
               my_so.data.encyclopedia.notificationEnemyDemon = this.notificationEnemyDemon;
               my_so.data.encyclopedia.notificationEnemyDemonMage = this.notificationEnemyDemonMage;
               my_so.data.encyclopedia.notificationEnemyDemonWolf = this.notificationEnemyDemonWolf;
               my_so.data.encyclopedia.notificationEnemyDemonImp = this.notificationEnemyDemonImp;
               my_so.data.encyclopedia.notificationEnemyNecromancer = this.notificationEnemyNecromancer;
               my_so.data.encyclopedia.notificationEnemySkeletor = this.notificationEnemySkeletor;
               my_so.data.encyclopedia.notificationEnemySkeletorBig = this.notificationEnemySkeletorBig;
               my_so.data.encyclopedia.notificationEnemyLavaElemental = this.notificationEnemyLavaElemental;
               my_so.data.encyclopedia.notificationEnemyVeznan = this.notificationEnemyVeznan;
               my_so.data.encyclopedia.notificationEnemyJuggernaut = this.notificationEnemyJuggernaut;
               my_so.data.encyclopedia.notificationEnemyYetiBoss = this.notificationEnemyYetiBoss;
               my_so.data.encyclopedia.notificationEnemySarelgazSmall = this.notificationEnemySarelgazSmall;
               my_so.data.encyclopedia.notificationEnemySarelgaz = this.notificationEnemySarelgaz;
               my_so.data.encyclopedia.notificationEnemyOrcArmored = this.notificationEnemyOrcArmored;
               my_so.data.encyclopedia.notificationEnemyGoblinZapper = this.notificationEnemyGoblinZapper;
               my_so.data.encyclopedia.notificationEnemyOrcWolfRider = this.notificationEnemyOrcWolfRider;
               my_so.data.encyclopedia.notificationEnemyForestTroll = this.notificationEnemyForestTroll;
               my_so.data.encyclopedia.notificationEnemyBossGoblinChieftain = this.notificationEnemyBossGoblinChieftain;
               my_so.data.encyclopedia.notificationEnemyZombie = this.notificationEnemyZombie;
               my_so.data.encyclopedia.notificationEnemyRottenSpider = this.notificationEnemyRottenSpider;
               my_so.data.encyclopedia.notificationEnemyRottenTree = this.notificationEnemyRottenTree;
               my_so.data.encyclopedia.notificationEnemySwampThing = this.notificationEnemySwampThing;
               my_so.data.encyclopedia.notificationEnemyBossGreenmuck = this.notificationEnemyBossGreenmuck;
               my_so.data.encyclopedia.notificationEnemyRaider = this.notificationEnemyRaider;
               my_so.data.encyclopedia.notificationEnemyPillager = this.notificationEnemyPillager;
               my_so.data.encyclopedia.notificationEnemyBossBandit = this.notificationEnemyBossBandit;
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
            if(my_so.data.encyclopedia == undefined)
            {
               my_so.data.encyclopedia = new Object();
            }
            this.notificationTowerArchersLevel2 = my_so.data.encyclopedia.notificationTowerArchersLevel2;
            this.notificationTowerArchersLevel3 = my_so.data.encyclopedia.notificationTowerArchersLevel3;
            this.notificationTowerArchersRanger = my_so.data.encyclopedia.notificationTowerArchersRanger;
            this.notificationTowerArchersMusketeer = my_so.data.encyclopedia.notificationTowerArchersMusketeer;
            this.notificationTowerSoldiersLevel2 = my_so.data.encyclopedia.notificationTowerSoldiersLevel2;
            this.notificationTowerSoldiersLevel3 = my_so.data.encyclopedia.notificationTowerSoldiersLevel3;
            this.notificationTowerSoldiersPaladin = my_so.data.encyclopedia.notificationTowerSoldiersPaladin;
            this.notificationTowerSoldiersBarbarian = my_so.data.encyclopedia.notificationTowerSoldiersBarbarian;
            this.notificationTowerMagesLevel2 = my_so.data.encyclopedia.notificationTowerMagesLevel2;
            this.notificationTowerMagesLevel3 = my_so.data.encyclopedia.notificationTowerMagesLevel3;
            this.notificationTowerMagesArcane = my_so.data.encyclopedia.notificationTowerMagesArcane;
            this.notificationTowerMagesSorcerer = my_so.data.encyclopedia.notificationTowerMagesSorcerer;
            this.notificationTowerEngineersLevel2 = my_so.data.encyclopedia.notificationTowerEngineersLevel2;
            this.notificationTowerEngineersLevel3 = my_so.data.encyclopedia.notificationTowerEngineersLevel3;
            this.notificationTowerEngineersBfg = my_so.data.encyclopedia.notificationTowerEngineersBfg;
            this.notificationTowerEngineersTesla = my_so.data.encyclopedia.notificationTowerEngineersTesla;
            this.notificationEnemyGoblin = my_so.data.encyclopedia.notificationEnemyGoblin;
            this.notificationEnemyFatOrc = my_so.data.encyclopedia.notificationEnemyFatOrc;
            this.notificationEnemyShaman = my_so.data.encyclopedia.notificationEnemyShaman;
            this.notificationEnemyOgre = my_so.data.encyclopedia.notificationEnemyOgre;
            this.notificationEnemyBandit = my_so.data.encyclopedia.notificationEnemyBandit;
            this.notificationEnemyBrigand = my_so.data.encyclopedia.notificationEnemyBrigand;
            this.notificationEnemyMarauder = my_so.data.encyclopedia.notificationEnemyMarauder;
            this.notificationEnemySpider = my_so.data.encyclopedia.notificationEnemySpider;
            this.notificationEnemySpiderSmall = my_so.data.encyclopedia.notificationEnemySpiderSmall;
            this.notificationEnemyGargoyle = my_so.data.encyclopedia.notificationEnemyGargoyle;
            this.notificationEnemyShadowArcher = my_so.data.encyclopedia.notificationEnemyShadowArcher;
            this.notificationEnemyDarkKnight = my_so.data.encyclopedia.notificationEnemyDarkKnight;
            this.notificationEnemySmallWolf = my_so.data.encyclopedia.notificationEnemySmallWolf;
            this.notificationEnemyWolf = my_so.data.encyclopedia.notificationEnemyWolf;
            this.notificationEnemyGolemHead = my_so.data.encyclopedia.notificationEnemyGolemHead;
            this.notificationEnemyWhiteWolf = my_so.data.encyclopedia.notificationEnemyWhiteWolf;
            this.notificationEnemyTroll = my_so.data.encyclopedia.notificationEnemyTroll;
            this.notificationEnemyTrollAxeThrower = my_so.data.encyclopedia.notificationEnemyTrollAxeThrower;
            this.notificationEnemyTrollChieftain = my_so.data.encyclopedia.notificationEnemyTrollChieftain;
            this.notificationEnemyYeti = my_so.data.encyclopedia.notificationEnemyYeti;
            this.notificationEnemyRocketeer = my_so.data.encyclopedia.notificationEnemyRocketeer;
            this.notificationEnemyDarkSlayer = my_so.data.encyclopedia.notificationEnemyDarkSlayer;
            this.notificationEnemyDemon = my_so.data.encyclopedia.notificationEnemyDemon;
            this.notificationEnemyDemonMage = my_so.data.encyclopedia.notificationEnemyDemonMage;
            this.notificationEnemyDemonWolf = my_so.data.encyclopedia.notificationEnemyDemonWolf;
            this.notificationEnemyDemonImp = my_so.data.encyclopedia.notificationEnemyDemonImp;
            this.notificationEnemyNecromancer = my_so.data.encyclopedia.notificationEnemyNecromancer;
            this.notificationEnemySkeletor = my_so.data.encyclopedia.notificationEnemySkeletor;
            this.notificationEnemySkeletorBig = my_so.data.encyclopedia.notificationEnemySkeletorBig;
            this.notificationEnemyLavaElemental = my_so.data.encyclopedia.notificationEnemyLavaElemental;
            this.notificationEnemyJuggernaut = my_so.data.encyclopedia.notificationEnemyJuggernaut;
            this.notificationEnemyYetiBoss = my_so.data.encyclopedia.notificationEnemyYetiBoss;
            this.notificationEnemyVeznan = my_so.data.encyclopedia.notificationEnemyVeznan;
            this.notificationEnemySarelgazSmall = my_so.data.encyclopedia.notificationEnemySarelgazSmall;
            this.notificationEnemySarelgaz = my_so.data.encyclopedia.notificationEnemySarelgaz;
            this.notificationEnemyOrcArmored = my_so.data.encyclopedia.notificationEnemyOrcArmored;
            this.notificationEnemyGoblinZapper = my_so.data.encyclopedia.notificationEnemyGoblinZapper;
            this.notificationEnemyOrcWolfRider = my_so.data.encyclopedia.notificationEnemyOrcWolfRider;
            this.notificationEnemyForestTroll = my_so.data.encyclopedia.notificationEnemyForestTroll;
            this.notificationEnemyBossGoblinChieftain = my_so.data.encyclopedia.notificationEnemyBossGoblinChieftain;
            this.notificationEnemyZombie = my_so.data.encyclopedia.notificationEnemyZombie;
            this.notificationEnemyRottenSpider = my_so.data.encyclopedia.notificationEnemyRottenSpider;
            this.notificationEnemyRottenTree = my_so.data.encyclopedia.notificationEnemyRottenTree;
            this.notificationEnemySwampThing = my_so.data.encyclopedia.notificationEnemySwampThing;
            this.notificationEnemyBossGreenmuck = my_so.data.encyclopedia.notificationEnemyBossGreenmuck;
            this.notificationEnemyRaider = my_so.data.encyclopedia.notificationEnemyRaider;
            this.notificationEnemyPillager = my_so.data.encyclopedia.notificationEnemyPillager;
            this.notificationEnemyBossBandit = my_so.data.encyclopedia.notificationEnemyBossBandit;
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
         this.notificationTowerArchersLevel2 = param1.notificationTowerArchersLevel2;
         this.notificationTowerArchersLevel3 = param1.notificationTowerArchersLevel3;
         this.notificationTowerArchersRanger = param1.notificationTowerArchersRanger;
         this.notificationTowerArchersMusketeer = param1.notificationTowerArchersMusketeer;
         this.notificationTowerSoldiersLevel2 = param1.notificationTowerSoldiersLevel2;
         this.notificationTowerSoldiersLevel3 = param1.notificationTowerSoldiersLevel3;
         this.notificationTowerSoldiersPaladin = param1.notificationTowerSoldiersPaladin;
         this.notificationTowerSoldiersBarbarian = param1.notificationTowerSoldiersBarbarian;
         this.notificationTowerMagesLevel2 = param1.notificationTowerMagesLevel2;
         this.notificationTowerMagesLevel3 = param1.notificationTowerMagesLevel3;
         this.notificationTowerMagesArcane = param1.notificationTowerMagesArcane;
         this.notificationTowerMagesSorcerer = param1.notificationTowerMagesSorcerer;
         this.notificationTowerEngineersLevel2 = param1.notificationTowerEngineersLevel2;
         this.notificationTowerEngineersLevel3 = param1.notificationTowerEngineersLevel3;
         this.notificationTowerEngineersBfg = param1.notificationTowerEngineersBfg;
         this.notificationTowerEngineersTesla = param1.notificationTowerEngineersTesla;
         this.notificationEnemyGoblin = param1.notificationEnemyGoblin;
         this.notificationEnemyFatOrc = param1.notificationEnemyFatOrc;
         this.notificationEnemyShaman = param1.notificationEnemyShaman;
         this.notificationEnemyOgre = param1.notificationEnemyOgre;
         this.notificationEnemyBandit = param1.notificationEnemyBandit;
         this.notificationEnemyBrigand = param1.notificationEnemyBrigand;
         this.notificationEnemyMarauder = param1.notificationEnemyMarauder;
         this.notificationEnemySpider = param1.notificationEnemySpider;
         this.notificationEnemySpiderSmall = param1.notificationEnemySpiderSmall;
         this.notificationEnemyGargoyle = param1.notificationEnemyGargoyle;
         this.notificationEnemyShadowArcher = param1.notificationEnemyShadowArcher;
         this.notificationEnemyDarkKnight = param1.notificationEnemyDarkKnight;
         this.notificationEnemySmallWolf = param1.notificationEnemySmallWolf;
         this.notificationEnemyWolf = param1.notificationEnemyWolf;
         this.notificationEnemyGolemHead = param1.notificationEnemyGolemHead;
         this.notificationEnemyWhiteWolf = param1.notificationEnemyWhiteWolf;
         this.notificationEnemyTroll = param1.notificationEnemyTroll;
         this.notificationEnemyTrollAxeThrower = param1.notificationEnemyTrollAxeThrower;
         this.notificationEnemyTrollChieftain = param1.notificationEnemyTrollChieftain;
         this.notificationEnemyYeti = param1.notificationEnemyYeti;
         this.notificationEnemyRocketeer = param1.notificationEnemyRocketeer;
         this.notificationEnemyDarkSlayer = param1.notificationEnemyDarkSlayer;
         this.notificationEnemyDemon = param1.notificationEnemyDemon;
         this.notificationEnemyDemonMage = param1.notificationEnemyDemonMage;
         this.notificationEnemyDemonWolf = param1.notificationEnemyDemonWolf;
         this.notificationEnemyDemonImp = param1.notificationEnemyDemonImp;
         this.notificationEnemyNecromancer = param1.notificationEnemyNecromancer;
         this.notificationEnemySkeletor = param1.notificationEnemySkeletor;
         this.notificationEnemySkeletorBig = param1.notificationEnemySkeletorBig;
         this.notificationEnemyLavaElemental = param1.notificationEnemyLavaElemental;
         this.notificationEnemyJuggernaut = param1.notificationEnemyJuggernaut;
         this.notificationEnemyYetiBoss = param1.notificationEnemyYetiBoss;
         this.notificationEnemyVeznan = param1.notificationEnemyVeznan;
         this.notificationEnemySarelgazSmall = param1.notificationEnemySarelgazSmall;
         this.notificationEnemySarelgaz = param1.notificationEnemySarelgaz;
         this.notificationEnemyOrcArmored = param1.notificationEnemyOrcArmored;
         this.notificationEnemyGoblinZapper = param1.notificationEnemyGoblinZapper;
         this.notificationEnemyOrcWolfRider = param1.notificationEnemyOrcWolfRider;
         this.notificationEnemyForestTroll = param1.notificationEnemyForestTroll;
         this.notificationEnemyBossGoblinChieftain = param1.notificationEnemyBossGoblinChieftain;
         this.notificationEnemyZombie = param1.notificationEnemyZombie;
         this.notificationEnemyRottenSpider = param1.notificationEnemyRottenSpider;
         this.notificationEnemyRottenTree = param1.notificationEnemyRottenTree;
         this.notificationEnemySwampThing = param1.notificationEnemySwampThing;
         this.notificationEnemyBossGreenmuck = param1.notificationEnemyBossGreenmuck;
         this.notificationEnemyRaider = param1.notificationEnemyRaider;
         this.notificationEnemyPillager = param1.notificationEnemyPillager;
         this.notificationEnemyBossBandit = param1.notificationEnemyBossBandit;
      }
      
      public function getEncyclopediaObject() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.notificationTowerArchersLevel2 = this.notificationTowerArchersLevel2;
         _loc1_.notificationTowerArchersLevel3 = this.notificationTowerArchersLevel3;
         _loc1_.notificationTowerArchersRanger = this.notificationTowerArchersRanger;
         _loc1_.notificationTowerArchersMusketeer = this.notificationTowerArchersMusketeer;
         _loc1_.notificationTowerSoldiersLevel2 = this.notificationTowerSoldiersLevel2;
         _loc1_.notificationTowerSoldiersLevel3 = this.notificationTowerSoldiersLevel3;
         _loc1_.notificationTowerSoldiersPaladin = this.notificationTowerSoldiersPaladin;
         _loc1_.notificationTowerSoldiersBarbarian = this.notificationTowerSoldiersBarbarian;
         _loc1_.notificationTowerMagesLevel2 = this.notificationTowerMagesLevel2;
         _loc1_.notificationTowerMagesLevel3 = this.notificationTowerMagesLevel3;
         _loc1_.notificationTowerMagesArcane = this.notificationTowerMagesArcane;
         _loc1_.notificationTowerMagesSorcerer = this.notificationTowerMagesSorcerer;
         _loc1_.notificationTowerEngineersLevel2 = this.notificationTowerEngineersLevel2;
         _loc1_.notificationTowerEngineersLevel3 = this.notificationTowerEngineersLevel3;
         _loc1_.notificationTowerEngineersBfg = this.notificationTowerEngineersBfg;
         _loc1_.notificationTowerEngineersTesla = this.notificationTowerEngineersTesla;
         _loc1_.notificationEnemyGoblin = this.notificationEnemyGoblin;
         _loc1_.notificationEnemyFatOrc = this.notificationEnemyFatOrc;
         _loc1_.notificationEnemyShaman = this.notificationEnemyShaman;
         _loc1_.notificationEnemyOgre = this.notificationEnemyOgre;
         _loc1_.notificationEnemyBandit = this.notificationEnemyBandit;
         _loc1_.notificationEnemyBrigand = this.notificationEnemyBrigand;
         _loc1_.notificationEnemyMarauder = this.notificationEnemyMarauder;
         _loc1_.notificationEnemySpider = this.notificationEnemySpider;
         _loc1_.notificationEnemySpiderSmall = this.notificationEnemySpiderSmall;
         _loc1_.notificationEnemyGargoyle = this.notificationEnemyGargoyle;
         _loc1_.notificationEnemyShadowArcher = this.notificationEnemyShadowArcher;
         _loc1_.notificationEnemyDarkKnight = this.notificationEnemyDarkKnight;
         _loc1_.notificationEnemySmallWolf = this.notificationEnemySmallWolf;
         _loc1_.notificationEnemyWolf = this.notificationEnemyWolf;
         _loc1_.notificationEnemyGolemHead = this.notificationEnemyGolemHead;
         _loc1_.notificationEnemyWhiteWolf = this.notificationEnemyWhiteWolf;
         _loc1_.notificationEnemyTroll = this.notificationEnemyTroll;
         _loc1_.notificationEnemyTrollAxeThrower = this.notificationEnemyTrollAxeThrower;
         _loc1_.notificationEnemyTrollChieftain = this.notificationEnemyTrollChieftain;
         _loc1_.notificationEnemyYeti = this.notificationEnemyYeti;
         _loc1_.notificationEnemyRocketeer = this.notificationEnemyRocketeer;
         _loc1_.notificationEnemyDarkSlayer = this.notificationEnemyDarkSlayer;
         _loc1_.notificationEnemyDemon = this.notificationEnemyDemon;
         _loc1_.notificationEnemyDemonMage = this.notificationEnemyDemonMage;
         _loc1_.notificationEnemyDemonWolf = this.notificationEnemyDemonWolf;
         _loc1_.notificationEnemyDemonImp = this.notificationEnemyDemonImp;
         _loc1_.notificationEnemyNecromancer = this.notificationEnemyNecromancer;
         _loc1_.notificationEnemySkeletor = this.notificationEnemySkeletor;
         _loc1_.notificationEnemySkeletorBig = this.notificationEnemySkeletorBig;
         _loc1_.notificationEnemyLavaElemental = this.notificationEnemyLavaElemental;
         _loc1_.notificationEnemyVeznan = this.notificationEnemyVeznan;
         _loc1_.notificationEnemyJuggernaut = this.notificationEnemyJuggernaut;
         _loc1_.notificationEnemyYetiBoss = this.notificationEnemyYetiBoss;
         _loc1_.notificationEnemySarelgazSmall = this.notificationEnemySarelgazSmall;
         _loc1_.notificationEnemySarelgaz = this.notificationEnemySarelgaz;
         _loc1_.notificationEnemyOrcArmored = this.notificationEnemyOrcArmored;
         _loc1_.notificationEnemyGoblinZapper = this.notificationEnemyGoblinZapper;
         _loc1_.notificationEnemyOrcWolfRider = this.notificationEnemyOrcWolfRider;
         _loc1_.notificationEnemyForestTroll = this.notificationEnemyForestTroll;
         _loc1_.notificationEnemyBossGoblinChieftain = this.notificationEnemyBossGoblinChieftain;
         _loc1_.notificationEnemyZombie = this.notificationEnemyZombie;
         _loc1_.notificationEnemyRottenSpider = this.notificationEnemyRottenSpider;
         _loc1_.notificationEnemyRottenTree = this.notificationEnemyRottenTree;
         _loc1_.notificationEnemySwampThing = this.notificationEnemySwampThing;
         _loc1_.notificationEnemyBossGreenmuck = this.notificationEnemyBossGreenmuck;
         _loc1_.notificationEnemyRaider = this.notificationEnemyRaider;
         _loc1_.notificationEnemyPillager = this.notificationEnemyPillager;
         _loc1_.notificationEnemyBossBandit = this.notificationEnemyBossBandit;
         return _loc1_;
      }
      
      public function destroyThis() : void
      {
         this.game = null;
      }
   }
}
