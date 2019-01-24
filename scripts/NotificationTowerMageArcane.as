package
{
   import flash.display.MovieClip;
   
   public class NotificationTowerMageArcane extends Notification
   {
       
      
      public var butClose:MovieClip;
      
      public function NotificationTowerMageArcane(param1:Level, param2:Boolean = true)
      {
         addFrameScript(13,this.frame14,24,this.frame25);
         super(param1,param2);
      }
      
      override protected function onInit() : void
      {
         this.level.unlockMaxMages = 4;
         this.level.unlockMaxBarracks = 4;
         this.level.game.gameEncyclopedia.notificationTowerMagesArcane = true;
         this.level.game.gameEncyclopedia.notificationTowerSoldiersPaladin = true;
         this.level.game.gameEncyclopedia.saveData();
      }
      
      override protected function onExit() : void
      {
      }
      
      function frame14() : *
      {
         stop();
      }
      
      function frame25() : *
      {
         stop();
      }
   }
}
