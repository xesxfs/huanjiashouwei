package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class AxeParticle extends MovieClip
   {
       
      
      private var fadeSpeed:Number;
      
      private var §_-B7§:Number;
      
      public function AxeParticle(param1:Point, param2:Number)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.rotation = param2;
         this.fadeSpeed = Math.random() * 0.05 + 0.28;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.alpha <= 0.15)
         {
            this.destroyThis();
            return;
         }
         this.alpha = this.alpha - this.fadeSpeed;
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      private function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
   }
}
