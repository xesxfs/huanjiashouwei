package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class NotificationPowerFireball extends Notification
   {
       
      
      public var butClose:MovieClip;
      
      public function NotificationPowerFireball(param1:Level, param2:Boolean = true)
      {
         addFrameScript(33,this.frame34,49,this.frame50);
         super(param1,param2);
      }
      
      override protected function onExit() : void
      {
         this.level.unlockPowerFireball();
         if(Level1(this.level).powerSign == null)
         {
            if(!this.level.game.pc || !this.level.game.pcLightning)
            {
               Level1(this.level).powerSign = new SignNewPower(new Point(75,527),Level1(this.level));
            }
            else
            {
               Level1(this.level).powerSign = new SignNewPower(new Point(50,527),Level1(this.level));
            }
            this.level.decals.addChild(Level1(this.level).powerSign);
         }
         else if(!this.level.game.pc || !this.level.game.pcLightning)
         {
            Level1(this.level).powerSign.x = 75;
            Level1(this.level).powerSign.y = 527;
         }
         else
         {
            Level1(this.level).powerSign.x = 50;
            Level1(this.level).powerSign.y = 527;
         }
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
