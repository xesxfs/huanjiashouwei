package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.net.SharedObject;
   import flash.utils.getDefinitionByName;
   
   public class Game extends MovieClip
   {
       
      
      public var main:Defense;
      
      public var map:Map;
      
      public var §_-Hj§:int = 77;
      
      public var starsWon:int = 77;
      
      public var stars:int = 77;
      
      public var difficulty:int;
      
      public var §_-6l§:Array;
      
      public var gameUpgrades:GameUpgrades;
      
      public var gameAchievement:GameAchievements;
      
      public var gameEncyclopedia:GameEncyclopedia;
      
      public var gameSounds:GameSounds;
      
      public var tips:int = 21;
      
      public var currentLevel:int;
      
      public var §_-Sq§:int = 0;
      
      public var selectedSlot:String;
      
      public var §_-3q§:Boolean = true;
      
      public var challengeShow:Boolean;
      
      public var heroShow:Boolean;
      
      public var earnFacebookStar:Boolean;
      
      public var earnTwitterStar:Boolean;
      
      public var onlineSelectedSlot:int;
      
      public var §_-Pd§:Boolean;
      
      public var pcAlreadyGot:Boolean;
      
      public var pcSelectedReinforcement:int;
      
      public var pcHasGold:Boolean;
      
      public var pcLightning:Boolean;
      
      public var pcExtraReinforcement:Boolean;
      
      public var pc:Boolean;
      
      public function Game(param1:Defense, param2:String)
      {
         this.§_-6l§ = [];
         super();
         this.main = param1;
         this.selectedSlot = param2;
         this.pc = this.main.mpc;
         this.§_-Pd§ = false;
         this.difficulty = GameSettings.DIFFICULTY_NORMAL;
         this.gameUpgrades = new GameUpgrades(this);
         this.gameAchievement = new GameAchievements(this);
         this.gameEncyclopedia = new GameEncyclopedia(this);
         this.gameSounds = new GameSounds();
         this.loadLevelsData();
         this.§continue§(null);
      }
      
      public function onUserItems(param1:Object) : void
      {
         if(param1.success && param1.data.length > 0)
         {
            this.main.mpc = true;
         }
         else
         {
            this.main.mpc = false;
         }
         this.pc = this.main.mpc;
      }
      
      public function §_-55§() : void
      {
         this.§_-Hj§ = this.§_-Hj§ + 25;
         this.pcAlreadyGot = true;
         this.pcExtraReinforcement = false;
         this.pcHasGold = false;
         this.pcLightning = false;
         this.pcSelectedReinforcement = GameSettings.§_-8-§;
         this.gameAchievement.§_-49§(this.starsWon);
         this.§_-9V§();
      }
      
      public function startLevel(param1:int, param2:int) : void
      {
         var _loc20_:Class = getDefinitionByName("Level" + param1) as Class;
         this.addChildAt(new _loc20_(this,param2),0);
         this.currentLevel = param1;
      }
      
      public function §continue§(param1:*) : void
      {
         if(param1 != null)
         {
            this.endLevel(param1);
         }
         this.map = new Map(this);
         this.addChild(this.map);
      }
      
      public function §_-Tu§() : void
      {
         this.removeChild(this.map);
         this.map = null;
      }
      
      public function restartLevel(param1:Level, param2:int) : void
      {
         this.gameAchievement.saveData();
         this.endLevel(param1);
         this.startLevel(this.currentLevel,param2);
      }
      
      public function endLevel(param1:Level) : void
      {
         param1.destroyThis();
         param1 = null;
      }
      
      public function getTip() : String
      {
         var _loc1_:* = Math.ceil(Math.random() * this.tips);
         return Locale.loadStringEx("TIP_" + _loc1_,Locale.getDefaultLang());
      }
      
      private function loadLevelsData() : void
      {
         this.§_-6l§.push(new SaveDataLevel(this,0,0));
         this.§_-6l§.push(new SaveDataLevel(this,1,0));
         this.§_-6l§.push(new SaveDataLevel(this,2,0));
         this.§_-6l§.push(new SaveDataLevel(this,3,0));
         this.§_-6l§.push(new SaveDataLevel(this,4,0));
         this.§_-6l§.push(new SaveDataLevel(this,5,0));
         this.§_-6l§.push(new SaveDataLevel(this,6,0));
         this.§_-6l§.push(new SaveDataLevel(this,7,0));
         this.§_-6l§.push(new SaveDataLevel(this,8,0));
         this.§_-6l§.push(new SaveDataLevel(this,9,0));
         this.§_-6l§.push(new SaveDataLevel(this,10,0));
         this.§_-6l§.push(new SaveDataLevel(this,11,0));
         this.§_-6l§.push(new SaveDataLevel(this,12,0));
         this.§_-6l§.push(new SaveDataLevel(this,13,0));
         this.§_-6l§.push(new SaveDataLevel(this,14,0));
         this.§_-6l§.push(new SaveDataLevel(this,15,0));
         this.§_-6l§.push(new SaveDataLevel(this,16,0));
         if(!this.§_-Pd§)
         {
            this.loadCookieData();
         }
         else if(this.main.onlineData == null || this.main.onlineData.levels == null)
         {
            this.§_-B3§();
         }
         else
         {
            this.loadOnlineData();
         }
      }
      
      private function loadOnlineData() : void
      {
         this.starsWon = this.main.onlineData.starsWon;
         this.stars = this.main.onlineData.stars;
         this.difficulty = this.main.onlineData.difficulty;
         this.earnFacebookStar = this.main.onlineData.earnFacebookStar;
         this.earnTwitterStar = this.main.onlineData.earnTwitterStar;
         this.challengeShow = this.main.onlineData.challengeShow;
         this.heroShow = this.main.onlineData.heroShow;
         var _loc1_:int = 0;
         while(_loc1_ < this.main.onlineData.levels.length)
         {
            SaveDataLevel(this.§_-6l§[this.main.onlineData.levels[_loc1_].index]).levelStatus = this.main.onlineData.levels[_loc1_].status;
            SaveDataLevel(this.§_-6l§[this.main.onlineData.levels[_loc1_].index]).stars = this.main.onlineData.levels[_loc1_].stars;
            if(SaveDataLevel(this.§_-6l§[this.main.onlineData.levels[_loc1_].index]).stars == 3)
            {
               SaveDataLevel(this.§_-6l§[this.main.onlineData.levels[_loc1_].index]).heroicMode = true;
               SaveDataLevel(this.§_-6l§[this.main.onlineData.levels[_loc1_].index]).ironMode = true;
            }
            SaveDataLevel(this.§_-6l§[this.main.onlineData.levels[_loc1_].index]).heroicModeWin = this.main.onlineData.levels[_loc1_].heroic;
            SaveDataLevel(this.§_-6l§[this.main.onlineData.levels[_loc1_].index]).ironModeWin = this.main.onlineData.levels[_loc1_].iron;
            SaveDataLevel(this.§_-6l§[this.main.onlineData.levels[_loc1_].index]).heroicModeView = this.main.onlineData.levels[_loc1_].heroicView;
            SaveDataLevel(this.§_-6l§[this.main.onlineData.levels[_loc1_].index]).ironModeView = this.main.onlineData.levels[_loc1_].ironView;
            SaveDataLevel(this.§_-6l§[this.main.onlineData.levels[_loc1_].index]).campaignDifficulty = this.main.onlineData.levels[_loc1_].campaignDifficulty;
            SaveDataLevel(this.§_-6l§[this.main.onlineData.levels[_loc1_].index]).heroicDifficulty = this.main.onlineData.levels[_loc1_].heroicDifficulty;
            SaveDataLevel(this.§_-6l§[this.main.onlineData.levels[_loc1_].index]).ironDifficulty = this.main.onlineData.levels[_loc1_].ironDifficulty;
            _loc1_++;
         }
         this.gameAchievement.loadFromObject(this.main.onlineData.achievements);
         this.gameUpgrades.loadFromObject(this.main.onlineData.upgrades);
         this.gameEncyclopedia.loadFromObject(this.main.onlineData.encyclopedia);
         this.pcAlreadyGot = this.main.onlineData.pcAlreadyGot;
         this.pcExtraReinforcement = this.main.onlineData.pcExtraReinforcement;
         this.pcHasGold = this.main.onlineData.pcHasGold;
         this.pcLightning = this.main.onlineData.pcLightning;
         this.pcSelectedReinforcement = this.main.onlineData.pcSelectedReinforcement;
         this.§_-7h§();
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-6l§.length)
         {
            if(SaveDataLevel(this.§_-6l§[_loc3_]).levelStatus == SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_NEW || SaveDataLevel(this.§_-6l§[_loc3_]).levelStatus == SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED)
            {
               _loc2_ = true;
               break;
            }
            _loc3_++;
         }
         if(!_loc2_)
         {
            this.setNextLevel();
         }
      }
      
      private function §_-7h§() : void
      {
         if(this.pc)
         {
            if(!this.pcAlreadyGot)
            {
               this.§_-55§();
            }
            else
            {
               this.§_-Hj§ = this.§_-Hj§ + 25;
            }
         }
         else
         {
            this.pcExtraReinforcement = false;
            this.pcHasGold = false;
            this.pcLightning = false;
            this.pcSelectedReinforcement = GameSettings.§_-8-§;
            if(this.pcAlreadyGot)
            {
               this.§_-Hj§ = this.§_-Hj§ + 15;
            }
         }
      }
      
      private function loadCookieData() : void
      {
         var my_so:SharedObject = null;
         var i:int = 0;
         var tmpStatus:int = 0;
         var j:int = 0;
         try
         {
            my_so = SharedObject.getLocal(this.selectedSlot);
         }
         catch(err:Error)
         {
            SaveDataLevel(this.§_-6l§[0]).levelStatus = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_NEW;
            return;
         }
         if(my_so.data.levels != undefined)
         {
            i = 0;
            while(i < my_so.data.levels.length)
            {
               SaveDataLevel(this.§_-6l§[my_so.data.levels[i].index]).levelStatus = my_so.data.levels[i].status;
               SaveDataLevel(this.§_-6l§[my_so.data.levels[i].index]).stars = my_so.data.levels[i].stars;
               if(SaveDataLevel(this.§_-6l§[my_so.data.levels[i].index]).stars == 3)
               {
                  SaveDataLevel(this.§_-6l§[my_so.data.levels[i].index]).heroicMode = true;
                  SaveDataLevel(this.§_-6l§[my_so.data.levels[i].index]).ironMode = true;
               }
               SaveDataLevel(this.§_-6l§[my_so.data.levels[i].index]).heroicModeWin = my_so.data.levels[i].heroic;
               SaveDataLevel(this.§_-6l§[my_so.data.levels[i].index]).ironModeWin = my_so.data.levels[i].iron;
               SaveDataLevel(this.§_-6l§[my_so.data.levels[i].index]).heroicModeView = my_so.data.levels[i].heroicView;
               SaveDataLevel(this.§_-6l§[my_so.data.levels[i].index]).ironModeView = my_so.data.levels[i].ironView;
               SaveDataLevel(this.§_-6l§[my_so.data.levels[i].index]).campaignDifficulty = my_so.data.levels[i].campaignDifficulty;
               SaveDataLevel(this.§_-6l§[my_so.data.levels[i].index]).heroicDifficulty = my_so.data.levels[i].heroicDifficulty;
               SaveDataLevel(this.§_-6l§[my_so.data.levels[i].index]).ironDifficulty = my_so.data.levels[i].ironDifficulty;
               i++;
            }
            this.starsWon = my_so.data.starsWon;
            this.stars = my_so.data.stars;
            this.difficulty = my_so.data.difficulty;
            this.earnFacebookStar = my_so.data.earnFacebookStar;
            this.earnTwitterStar = my_so.data.earnTwitterStar;
            this.challengeShow = my_so.data.challengeShow;
            this.heroShow = my_so.data.heroShow;
            this.pcAlreadyGot = my_so.data.pcAlreadyGot;
            this.pcExtraReinforcement = my_so.data.pcExtraReinforcement;
            this.pcHasGold = my_so.data.pcHasGold;
            this.pcLightning = my_so.data.pcLightning;
            this.pcSelectedReinforcement = my_so.data.pcSelectedReinforcement;
            my_so.close();
            this.gameAchievement.loadData();
            this.gameUpgrades.loadData();
            this.gameEncyclopedia.loadData();
            this.§_-7h§();
         }
         else
         {
            SaveDataLevel(this.§_-6l§[0]).levelStatus = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_NEW;
            my_so.data.levels = [];
            my_so.data.achievements = new Object();
            my_so.data.upgrades = new Object();
            my_so.data.encyclopedia = new Object();
            my_so.data.starsWon = this.starsWon;
            my_so.data.stars = this.stars;
            my_so.data.difficulty = GameSettings.DIFFICULTY_NORMAL;
            my_so.data.earnFacebookStar = false;
            my_so.data.earnTwitterStar = false;
            my_so.data.challengeShow = this.challengeShow;
            my_so.data.heroShow = false;
            j = 0;
            while(j < this.§_-6l§.length)
            {
               if(j == 0)
               {
                  tmpStatus = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_NEW;
               }
               else
               {
                  tmpStatus = SaveDataLevel.LEVEL_DISABLED;
               }
               my_so.data.levels.push({
                  "index":j,
                  "status":tmpStatus,
                  "stars":0,
                  "heroic":false,
                  "iron":false,
                  "heroicView":false,
                  "ironView":false,
                  "campaignDifficulty":2,
                  "heroicDifficulty":2,
                  "ironDifficulty":2
               });
               j++;
            }
            my_so.data.achievements = this.gameAchievement.getAchievementObject();
            my_so.data.upgrades = this.gameUpgrades.getUpgradesObject();
            my_so.data.encyclopedia = this.gameEncyclopedia.getEncyclopediaObject();
            my_so.data.pcAlreadyGot = this.pcAlreadyGot;
            my_so.data.pcExtraReinforcement = this.pcExtraReinforcement;
            my_so.data.pcHasGold = this.pcHasGold;
            my_so.data.pcLightning = this.pcLightning;
            my_so.data.pcSelectedReinforcement = this.pcSelectedReinforcement;
            this.§_-7h§();
            my_so.flush();
            my_so.close();
         }
         var hasNew:Boolean = false;
         var h:int = 0;
         while(h < this.§_-6l§.length)
         {
            if(SaveDataLevel(this.§_-6l§[h]).levelStatus == SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_NEW || SaveDataLevel(this.§_-6l§[h]).levelStatus == SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED)
            {
               hasNew = true;
               break;
            }
            h++;
         }
         if(!hasNew)
         {
            this.setNextLevel();
         }
      }
      
      public function setNextLevel() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-6l§.length)
         {
            if(SaveDataLevel(this.§_-6l§[_loc2_]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED || SaveDataLevel(this.§_-6l§[_loc2_]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_NEW || SaveDataLevel(this.§_-6l§[_loc2_]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_BETTER)
            {
               _loc1_ = _loc2_;
            }
            _loc2_++;
         }
         if(_loc1_ < 11)
         {
            SaveDataLevel(this.§_-6l§[_loc1_ + 1]).levelStatus = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED;
         }
      }
      
      public function §_-Bn§() : void
      {
         var § 0§:SharedObject = null;
         if(!this.§_-Pd§)
         {
            try
            {
               § 0§ = SharedObject.getLocal(this.selectedSlot);
               § 0§.data.starsWon = this.starsWon;
               § 0§.data.stars = this.stars;
               § 0§.flush();
               § 0§.close();
               return;
            }
            catch(err:Error)
            {
               return;
            }
         }
      }
      
      public function setDifficulty(param1:int) : void
      {
         var my_so:SharedObject = null;
         var difficulty:int = param1;
         if(this.difficulty == difficulty)
         {
            return;
         }
         this.difficulty = difficulty;
         if(!this.§_-Pd§)
         {
            try
            {
               my_so = SharedObject.getLocal(this.selectedSlot);
               my_so.data.difficulty = this.difficulty;
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
      
      public function §const§() : void
      {
         var § 0§:SharedObject = null;
         if(!this.§_-Pd§)
         {
            try
            {
               § 0§ = SharedObject.getLocal(this.selectedSlot);
               § 0§.data.challengeShow = this.challengeShow;
               § 0§.flush();
               § 0§.close();
               return;
            }
            catch(err:Error)
            {
               return;
            }
         }
      }
      
      public function earnFacebookSocial() : Boolean
      {
         var my_so:SharedObject = null;
         if(this.earnFacebookStar)
         {
            return false;
         }
         this.earnFacebookStar = true;
         this.starsWon = this.starsWon + 1;
         this.stars = this.stars + 1;
         if(!this.§_-Pd§)
         {
            try
            {
               my_so = SharedObject.getLocal(this.selectedSlot);
               my_so.data.earnFacebookStar = true;
               my_so.data.starsWon = this.starsWon;
               my_so.data.stars = this.stars;
               my_so.flush();
               my_so.close();
            }
            catch(err:Error)
            {
            }
         }
         return true;
      }
      
      public function earnTwitterSocial() : Boolean
      {
         var my_so:SharedObject = null;
         if(this.earnTwitterStar)
         {
            return false;
         }
         this.earnTwitterStar = true;
         this.starsWon = this.starsWon + 1;
         this.stars = this.stars + 1;
         if(!this.§_-Pd§)
         {
            try
            {
               my_so = SharedObject.getLocal(this.selectedSlot);
               my_so.data.earnTwitterStar = true;
               my_so.data.starsWon = this.starsWon;
               my_so.data.stars = this.stars;
               my_so.flush();
               my_so.close();
            }
            catch(err:Error)
            {
            }
         }
         return true;
      }
      
      public function setCookieNotificationHeroShow() : void
      {
         var my_so:SharedObject = null;
         if(!this.§_-Pd§)
         {
            try
            {
               my_so = SharedObject.getLocal(this.selectedSlot);
               my_so.data.heroShow = this.heroShow;
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
      
      public function §_-9V§() : void
      {
         var § 0§:SharedObject = null;
         var § 1§:int = 0;
         var § 2§:Boolean = false;
         var § 3§:int = 0;
         try
         {
            § 0§ = SharedObject.getLocal(this.selectedSlot);
            § 0§.data.starsWon = this.starsWon;
            § 0§.data.stars = this.stars;
            § 0§.data.difficulty = this.difficulty;
            § 0§.data.earnFacebookStar = this.earnFacebookStar;
            § 0§.data.earnTwitterStar = this.earnTwitterStar;
            § 0§.data.challengeShow = this.challengeShow;
            § 0§.data.heroShow = this.heroShow;
            § 0§.data.levels = [];
            § 1§ = 0;
            § 2§ = false;
            § 3§ = 0;
            while(§ 3§ < this.§_-6l§.length)
            {
               if(§ 2§)
               {
                  § 1§ = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_NEW;
                  § 2§ = false;
               }
               else if(SaveDataLevel(this.§_-6l§[§ 3§]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_NEW)
               {
                  § 1§ = SaveDataLevel.LEVEL_ENABLED_COMPLETED;
                  § 2§ = true;
               }
               else
               {
                  § 1§ = SaveDataLevel(this.§_-6l§[§ 3§]).levelStatus;
               }
               § 0§.data.levels.push({
                  "index":§ 3§,
                  "status":§ 1§,
                  "stars":SaveDataLevel(this.§_-6l§[§ 3§]).stars,
                  "heroicView":SaveDataLevel(this.§_-6l§[§ 3§]).heroicModeView,
                  "ironView":SaveDataLevel(this.§_-6l§[§ 3§]).ironModeView,
                  "heroic":SaveDataLevel(this.§_-6l§[§ 3§]).heroicModeWin,
                  "iron":SaveDataLevel(this.§_-6l§[§ 3§]).ironModeWin,
                  "campaignDifficulty":SaveDataLevel(this.§_-6l§[§ 3§]).campaignDifficulty,
                  "heroicDifficulty":SaveDataLevel(this.§_-6l§[§ 3§]).heroicDifficulty,
                  "ironDifficulty":SaveDataLevel(this.§_-6l§[§ 3§]).ironDifficulty
               });
               § 3§++;
            }
            § 0§.data.achievements = this.gameAchievement.getAchievementObject();
            § 0§.data.upgrades = this.gameUpgrades.getUpgradesObject();
            § 0§.data.encyclopedia = this.gameEncyclopedia.getEncyclopediaObject();
            § 0§.data.pcAlreadyGot = this.pcAlreadyGot;
            § 0§.data.pcExtraReinforcement = this.pcExtraReinforcement;
            § 0§.data.pcHasGold = this.pcHasGold;
            § 0§.data.pcLightning = this.pcLightning;
            § 0§.data.pcSelectedReinforcement = this.pcSelectedReinforcement;
            § 0§.data.challengeShow = this.challengeShow;
            § 0§.flush();
            § 0§.close();
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      public function §_-B3§() : void
      {
         SaveDataLevel(this.§_-6l§[0]).levelStatus = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_NEW;
         this.§_-7h§();
      }
      
      public function §_-4z§() : void
      {
         this.main.agi.submitUserData("slot" + this.onlineSelectedSlot.toString(),this.getOnlineFullSaveObject(),this.§_-AH§);
      }
      
      public function §_-AH§(param1:Object) : void
      {
         if(!param1.success)
         {
         }
      }
      
      public function getOnlineFullSaveObject() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.starsWon = this.starsWon;
         _loc1_.stars = this.stars;
         _loc1_.difficulty = this.difficulty;
         _loc1_.earnFacebookStar = this.earnFacebookStar;
         _loc1_.earnTwitterStar = this.earnTwitterStar;
         _loc1_.challengeShow = this.challengeShow;
         _loc1_.heroShow = this.heroShow;
         _loc1_.levels = [];
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < this.§_-6l§.length)
         {
            if(_loc3_)
            {
               _loc2_ = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_NEW;
               _loc3_ = false;
            }
            else if(SaveDataLevel(this.§_-6l§[_loc4_]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_NEW)
            {
               _loc2_ = SaveDataLevel.LEVEL_ENABLED_COMPLETED;
               _loc3_ = true;
            }
            else
            {
               _loc2_ = SaveDataLevel(this.§_-6l§[_loc4_]).levelStatus;
            }
            _loc1_.levels.push({
               "index":_loc4_,
               "status":_loc2_,
               "stars":SaveDataLevel(this.§_-6l§[_loc4_]).stars,
               "heroicView":SaveDataLevel(this.§_-6l§[_loc4_]).heroicModeView,
               "ironView":SaveDataLevel(this.§_-6l§[_loc4_]).ironModeView,
               "heroic":SaveDataLevel(this.§_-6l§[_loc4_]).heroicModeWin,
               "iron":SaveDataLevel(this.§_-6l§[_loc4_]).ironModeWin,
               "campaignDifficulty":SaveDataLevel(this.§_-6l§[_loc4_]).campaignDifficulty,
               "heroicDifficulty":SaveDataLevel(this.§_-6l§[_loc4_]).heroicDifficulty,
               "ironDifficulty":SaveDataLevel(this.§_-6l§[_loc4_]).ironDifficulty
            });
            _loc4_++;
         }
         _loc1_.achievements = this.gameAchievement.getAchievementObject();
         _loc1_.upgrades = this.gameUpgrades.getUpgradesObject();
         _loc1_.encyclopedia = this.gameEncyclopedia.getEncyclopediaObject();
         _loc1_.pcAlreadyGot = this.pcAlreadyGot;
         _loc1_.pcExtraReinforcement = this.pcExtraReinforcement;
         _loc1_.pcHasGold = this.pcHasGold;
         _loc1_.pcLightning = this.pcLightning;
         _loc1_.pcSelectedReinforcement = this.pcSelectedReinforcement;
         _loc1_.challengeShow = this.challengeShow;
         return _loc1_;
      }
      
      public function destroyThis() : void
      {
         this.gameUpgrades.destroyThis();
         this.gameAchievement.destroyThis();
         this.gameEncyclopedia.destroyThis();
         this.gameSounds.destroyThis();
         this.gameAchievement = null;
         this.gameAchievement = null;
         this.gameEncyclopedia = null;
         this.gameSounds = null;
         this.parent.removeChild(this);
      }
   }
}
