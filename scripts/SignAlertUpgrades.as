package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class SignAlertUpgrades extends MovieClip
   {
       
      
      public var §_-Rj§:MovieClip;
      
      public function SignAlertUpgrades(param1:Point, param2:int)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         if(param2 == 1)
         {
            this.§_-Rj§.txt.text = param2.toString() + " star!";
         }
         else
         {
            this.§_-Rj§.txt.text = param2.toString() + " 顆星！";
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
