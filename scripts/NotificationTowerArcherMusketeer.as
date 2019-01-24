package
{
   import flash.display.MovieClip;
   
   public class NotificationTowerArcherMusketeer extends Notification
   {
       
      
      public var butClose:MovieClip;
      
      public function NotificationTowerArcherMusketeer(param1:Level, param2:Boolean = true)
      {
         addFrameScript(12,this.frame13,24,this.frame25);
         super(param1,param2);
      }
      
      override protected function onInit() : void
      {
         this.level.unlockMaxArchers = 5;
         this.level.game.gameEncyclopedia.notificationTowerArchersMusketeer = true;
         this.level.game.gameEncyclopedia.saveData();
      }
      
      override protected function onExit() : void
      {
      }
      
      function frame13() : *
      {
         stop();
      }
      
      function frame25() : *
      {
         stop();
      }
   }
}
