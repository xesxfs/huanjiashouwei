package
{
   import flash.display.MovieClip;
   
   public class NotificationTipArmor extends Notification
   {
       
      
      public var butClose:MovieClip;
      
      public function NotificationTipArmor(param1:Level, param2:Boolean = true)
      {
         addFrameScript(17,this.frame18,25,this.frame26);
         super(param1,param2);
         this.inTime = 17;
         this.outTime = 7;
      }
      
      override protected function onExit() : void
      {
         this.level.notificationHolder.closeSelected();
      }
      
      function frame18() : *
      {
         stop();
      }
      
      function frame26() : *
      {
         stop();
      }
   }
}
