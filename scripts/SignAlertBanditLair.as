package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class SignAlertBanditLair extends MovieClip
   {
       
      
      private var pc:Boolean;
      
      public function SignAlertBanditLair(param1:Point)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function setPC(param1:Boolean) : void
      {
         this.pc = param1;
         if(this.pc)
         {
            this.gotoAndStop("banditlair_premium");
         }
         else
         {
            this.gotoAndStop("banditlair_nopremium");
         }
      }
      
      public function closeMe() : void
      {
         this.destroyThis();
      }
      
      public function destroyThis() : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}
