package
{
   import flash.display.MovieClip;
   
   public class NotificationTowerLevel2 extends Notification
   {
       
      
      public var butClose:MovieClip;
      
      public function NotificationTowerLevel2(param1:Level, param2:Boolean = true)
      {
         addFrameScript(16,this.frame17,28,this.frame29);
         super(param1,param2);
         this.inTime = 27;
         this.outTime = 21;
      }
      
      override protected function onInit() : void
      {
         this.level.unlockMaxMages = 2;
         this.level.unlockMaxArchers = 2;
         this.level.unlockMaxBarracks = 2;
         this.level.unlockMaxEngineers = 2;
         this.level.game.gameEncyclopedia.notificationTowerArchersLevel2 = true;
         this.level.game.gameEncyclopedia.notificationTowerSoldiersLevel2 = true;
         this.level.game.gameEncyclopedia.notificationTowerEngineersLevel2 = true;
         this.level.game.gameEncyclopedia.notificationTowerMagesLevel2 = true;
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
