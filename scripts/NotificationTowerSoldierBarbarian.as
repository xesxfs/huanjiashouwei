package
{
   import flash.display.MovieClip;
   
   public class NotificationTowerSoldierBarbarian extends Notification
   {
       
      
      public var butClose:MovieClip;
      
      public function NotificationTowerSoldierBarbarian(param1:Level, param2:Boolean = true)
      {
         addFrameScript(13,this.frame14,24,this.frame25);
         super(param1,param2);
      }
      
      override protected function onInit() : void
      {
         this.level.unlockMaxBarracks = 5;
         this.level.unlockMaxEngineers = 4;
         this.level.game.gameEncyclopedia.notificationTowerSoldiersBarbarian = true;
         this.level.game.gameEncyclopedia.notificationTowerEngineersBfg = true;
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
