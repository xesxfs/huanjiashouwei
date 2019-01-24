package
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class §_-16§ extends MovieClip
   {
       
      
      public var isActive:Boolean;
      
      public var §_-My§:int;
      
      private var fadeSpeed:Number;
      
      private var alphaTime:int = 1;
      
      private var alphaTimeCounter:int;
      
      private var §_-B7§:Number;
      
      public function §_-16§()
      {
         super();
         addFrameScript(3,this.frame4);
         this.isActive = false;
         this.stop();
      }
      
      public function onFrameUpdate() : void
      {
         this.§_-My§++;
         if(this.alpha <= 0.15)
         {
            this.§_-OJ§();
            return;
         }
         if(this.alphaTimeCounter < this.alphaTime)
         {
            this.alphaTimeCounter++;
         }
         else
         {
            this.alpha = this.alpha - this.fadeSpeed;
         }
         this.scaleX = this.scaleX + this.fadeSpeed;
         this.scaleY = this.scaleY + this.fadeSpeed;
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "travel":
               this.play();
         }
      }
      
      public function §_-Rt§(param1:Point, param2:Sprite) : void
      {
         this.x = param1.x;
         this.y = param1.y;
         this.isActive = true;
         this.§_-My§ = 0;
         this.alpha = 1;
         this.alphaTime = 1;
         this.alphaTimeCounter = 0;
         this.rotation = Math.random() * 360;
         this.scaleX = Math.random() * 0.75 + 0.35;
         this.scaleY = Math.random() * 0.75 + 0.35;
         this.fadeSpeed = Math.random() * 0.05 + 0.08;
         param2.addChild(this);
         this.gotoAndPlay("travel");
      }
      
      public function §_-OJ§() : void
      {
         this.stop();
         this.isActive = false;
         this.parent.removeChild(this);
      }
      
      private function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
      
      function frame4() : *
      {
         stop();
      }
   }
}
