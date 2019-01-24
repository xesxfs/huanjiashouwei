package
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class MissileParticle extends MovieClip
   {
       
      
      public var isActive:Boolean;
      
      public var §_-My§:int;
      
      private var fadeSpeed:Number;
      
      private var §_-B7§:Number;
      
      public function MissileParticle()
      {
         super();
         this.isActive = false;
      }
      
      public function onFrameUpdate() : void
      {
         this.§_-My§++;
         if(this.alpha <= 0.15)
         {
            this.§_-OJ§();
            return;
         }
         this.alpha = this.alpha - this.fadeSpeed;
         this.scaleX = this.scaleX + this.fadeSpeed;
         this.scaleY = this.scaleY + this.fadeSpeed;
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      public function §_-Rt§(param1:Point, param2:Sprite) : void
      {
         this.x = param1.x;
         this.y = param1.y;
         this.isActive = true;
         this.§_-My§ = 0;
         this.alpha = 1;
         this.rotation = Math.random() * 360;
         this.scaleX = Math.random() * 0.75 + 0.25;
         this.scaleY = Math.random() * 0.75 + 0.25;
         this.fadeSpeed = Math.random() * 0.05 + 0.01;
         param2.addChild(this);
      }
      
      public function §_-OJ§() : void
      {
         this.isActive = false;
         this.parent.removeChild(this);
      }
   }
}
