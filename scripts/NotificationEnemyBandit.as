package
{
   import flash.display.MovieClip;
   
   public class NotificationEnemyBandit extends Notification
   {
       
      
      public var butClose:MovieClip;
      
      public function NotificationEnemyBandit(param1:Level, param2:Boolean = true)
      {
         addFrameScript(33,this.frame34,47,this.frame48);
         super(param1,param2);
      }
      
      override protected function onExit() : void
      {
         this.level.notificationHolder.closeSelected();
      }
      
      function frame34() : *
      {
         stop();
      }
      
      function frame48() : *
      {
         stop();
      }
   }
}
