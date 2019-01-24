package
{
   import flash.display.MovieClip;
   
   public class NotificationTowerArcherRanger extends Notification
   {
       
      
      public var butClose:MovieClip;
      
      public function NotificationTowerArcherRanger(param1:Level, param2:Boolean = true)
      {
         addFrameScript(12,this.frame13,24,this.frame25);
         super(param1,param2);
      }
      
      override protected function onInit() : void
      {
         this.level.unlockMaxArchers = 4;
         this.level.game.gameEncyclopedia.notificationTowerArchersRanger = true;
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
