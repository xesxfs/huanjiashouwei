package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class SignAlertSarelgazLocked extends MovieClip
   {
       
      
      private var pc:Boolean;
      
      public function SignAlertSarelgazLocked(param1:Point)
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
            this.gotoAndStop("sarelgaz_premium");
         }
         else
         {
            this.gotoAndStop("sarelgaz_nopremium");
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
