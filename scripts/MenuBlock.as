package
{
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.Sprite;
   
   public class MenuBlock extends Sprite
   {
       
      
      public var §_-SH§:Sprite;
      
      protected var §_-MF§:Boolean;
      
      protected var alphaTweenIn:Tween;
      
      protected var alphaTweenOut:Tween;
      
      public function MenuBlock()
      {
         super();
         this.§_-SH§ = new Sprite();
         this.§_-SH§.graphics.beginFill(0);
         this.§_-SH§.graphics.drawRect(0,0,700,600);
         this.§_-SH§.graphics.endFill();
         this.§_-SH§.x = 0;
         this.§_-SH§.y = 0;
         this.§_-SH§.alpha = 0.45;
         this.addChild(this.§_-SH§);
         this.§_-MF§ = false;
      }
      
      public function show() : void
      {
         this.§_-MF§ = false;
         this.alphaTweenIn = new Tween(this,"alpha",Strong.easeOut,0,1,20,false);
         if(this.alphaTweenOut != null && this.alphaTweenOut.hasEventListener(TweenEvent.MOTION_FINISH))
         {
            this.alphaTweenOut.removeEventListener(TweenEvent.MOTION_FINISH,this.alphaFinish);
         }
      }
      
      public function hide() : void
      {
         this.alphaTweenOut = new Tween(this,"alpha",Strong.easeOut,1,0,20,false);
         this.alphaTweenOut.addEventListener(TweenEvent.MOTION_FINISH,this.alphaFinish,false,0,true);
      }
      
      protected function alphaFinish(param1:TweenEvent) : *
      {
         this.destroyThis();
      }
      
      private function destroyThis() : void
      {
         this.§_-SH§ = null;
         if(this.§_-MF§)
         {
            return;
         }
         this.§_-MF§ = true;
         if(this.alphaTweenOut != null)
         {
            this.alphaTweenOut.removeEventListener(TweenEvent.MOTION_FINISH,this.alphaFinish);
            this.alphaTweenOut = null;
         }
         this.alphaTweenIn = null;
         this.parent.removeChild(this);
      }
   }
}
