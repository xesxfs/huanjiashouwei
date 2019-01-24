package
{
   import flash.display.MovieClip;
   
   public class NotificationTowerLevel3 extends Notification
   {
       
      
      public var butClose:MovieClip;
      
      public function NotificationTowerLevel3(param1:Level, param2:Boolean = true)
      {
         addFrameScript(16,this.frame17,28,this.frame29);
         super(param1,param2);
         this.inTime = 27;
         this.outTime = 21;
      }
      
      override protected function onInit() : void
      {
         this.level.unlockMaxMages = 3;
         this.level.unlockMaxArchers = 3;
         this.level.unlockMaxBarracks = 3;
         this.level.unlockMaxEngineers = 3;
         this.level.game.gameEncyclopedia.notificationTowerArchersLevel3 = true;
         this.level.game.gameEncyclopedia.notificationTowerSoldiersLevel3 = true;
         this.level.game.gameEncyclopedia.notificationTowerEngineersLevel3 = true;
         this.level.game.gameEncyclopedia.notificationTowerMagesLevel3 = true;
         this.level.game.gameEncyclopedia.saveData();
      }
      
      override protected function onExit() : void
      {
      }
      
      function frame17() : *
      {
         stop();
      }
      
      function frame29() : *
      {
         stop();
      }
   }
}
