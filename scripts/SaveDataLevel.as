package
{
   import flash.net.SharedObject;
   
   public class SaveDataLevel
   {
      
      public static const LEVEL_DISABLED:int = 0;
      
      public static const LEVEL_ENABLED_UNCOMPLETED_NEW:int = 10;
      
      public static const LEVEL_ENABLED_UNCOMPLETED:int = 11;
      
      public static const LEVEL_ENABLED_UNCOMPLETED_LOCKED:int = 12;
      
      public static const LEVEL_ENABLED_COMPLETED_NEW:int = 20;
      
      public static const LEVEL_ENABLED_COMPLETED:int = 21;
      
      public static const LEVEL_ENABLED_COMPLETED_BETTER:int = 22;
       
      
      public var levelStatus:int;
      
      public var levelIndex:int;
      
      public var §_-9u§:int;
      
      public var currentEnemiesDefeated:int;
      
      public var §_-4O§:int;
      
      public var §_-DA§:int;
      
      public var §_-A1§:int;
      
      public var campaignDifficulty:int = 2;
      
      public var heroicDifficulty:int = 2;
      
      public var ironDifficulty:int = 2;
      
      public var stars:int;
      
      public var starsBetter:int;
      
      public var heroicMode:Boolean = false;
      
      public var ironMode:Boolean = false;
      
      public var heroicModeView:Boolean = false;
      
      public var heroicModeCurrent:Boolean = false;
      
      public var heroicModeRecently:Boolean = false;
      
      public var heroicModeWin:Boolean = false;
      
      public var ironModeView:Boolean = false;
      
      public var ironModeCurrent:Boolean = false;
      
      public var ironModeRecently:Boolean = false;
      
      public var ironModeWin:Boolean = false;
      
      public var enemiesDefeated:int;
      
      public var §_-EM§:int;
      
      public var §_-QQ§:int;
      
      public var §_-JQ§:int;
      
      public var game:Game;
      
      public function SaveDataLevel(param1:Game, param2:int, param3:int)
      {
         super();
         this.game = param1;
         this.levelIndex = param2;
         this.stars = param3;
         if(this.stars == 3)
         {
            this.heroicMode = true;
            this.ironMode = true;
         }
         this.levelStatus = LEVEL_DISABLED;
         this.resetCurrentGameData();
      }
      
      public function §_-RH§(param1:int) : void
      {
         this.levelStatus = param1;
      }
      
      public function setStatus(param1:int) : void
      {
         var my_so:SharedObject = null;
         var levelStatus:int = param1;
         this.levelStatus = levelStatus;
         if(!this.game.§_-Pd§)
         {
            try
            {
               my_so = SharedObject.getLocal(this.game.selectedSlot);
               my_so.data.levels[this.levelIndex].status = this.levelStatus;
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
      
      public function win() : void
      {
         var my_so:SharedObject = null;
         if(this.levelStatus != LEVEL_ENABLED_COMPLETED && this.levelStatus != LEVEL_ENABLED_COMPLETED_BETTER)
         {
            this.levelStatus = LEVEL_ENABLED_COMPLETED_NEW;
            this.stars = this.§_-9u§;
         }
         else if(this.§_-9u§ > this.stars)
         {
            this.levelStatus = LEVEL_ENABLED_COMPLETED_BETTER;
            this.starsBetter = this.§_-9u§ - this.stars;
            this.stars = this.§_-9u§;
         }
         if(this.stars == 3)
         {
            this.heroicMode = true;
            this.ironMode = true;
         }
         if(!this.game.§_-Pd§)
         {
            try
            {
               my_so = SharedObject.getLocal(this.game.selectedSlot);
               my_so.clear();
               my_so.close();
               this.game.§_-9V§();
               return;
            }
            catch(err:Error)
            {
               return;
            }
         }
      }
      
      public function §_-LP§() : void
      {
         var § 0§:SharedObject = null;
         this.heroicModeView = true;
         this.ironModeView = true;
         if(!this.game.§_-Pd§)
         {
            try
            {
               § 0§ = SharedObject.getLocal(this.game.selectedSlot);
               § 0§.data.levels[this.levelIndex].heroicView = true;
               § 0§.data.levels[this.levelIndex].ironView = true;
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
      
      public function resetCurrentGameData() : void
      {
         this.currentEnemiesDefeated = 0;
         this.§_-DA§ = 0;
         this.§_-4O§ = 0;
      }
   }
}
