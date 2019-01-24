package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class NotificationPowerReinforcement extends Notification
   {
       
      
      public var butClose:MovieClip;
      
      public function NotificationPowerReinforcement(param1:Level, param2:Boolean = true)
      {
         addFrameScript(33,this.frame34,49,this.frame50);
         super(param1,param2);
      }
      
      override protected function onExit() : void
      {
         this.level.unlockPowerReinforcement();
         if(!this.level.game.pc || !this.level.game.pcLightning)
         {
            Level1(this.level).powerSign = new SignNewPower(new Point(140,527),Level1(this.level));
         }
         else
         {
            Level1(this.level).powerSign = new SignNewPower(new Point(107,527),Level1(this.level));
         }
         this.level.decals.addChild(Level1(this.level).powerSign);
      }
      
      function frame34() : *
      {
         stop();
      }
      
      function frame50() : *
      {
         stop();
      }
   }
}
