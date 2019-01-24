package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class AxeParticleEnemy extends MovieClip
   {
       
      
      private var fadeSpeed:Number;
      
      private var §_-B7§:Number;
      
      public function AxeParticleEnemy(param1:Point, param2:Number)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.rotation = param2;
         this.fadeSpeed = Math.random() * 0.05 + 0.08;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.alpha <= 0.05)
         {
            this.destroyThis();
            return;
         }
         this.alpha = this.alpha - this.fadeSpeed;
         this.scaleX = this.scaleX - this.fadeSpeed;
         this.scaleY = this.scaleY - this.fadeSpeed;
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
