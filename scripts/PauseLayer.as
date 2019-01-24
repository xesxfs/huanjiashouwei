package
{
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.Sprite;
   
   public class PauseLayer extends Sprite
   {
       
      
      protected var §_-MF§:Boolean;
      
      protected var alphaTweenIn:Tween;
      
      protected var alphaTweenOut:Tween;
      
      public function PauseLayer()
      {
         super();
         this.§_-MF§ = false;
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(0);
         _loc1_.graphics.drawRect(0,0,700,600);
         _loc1_.graphics.endFill();
         _loc1_.alpha = 1;
         this.addChild(_loc1_);
      }
      
      public function show() : void
      {
         this.§_-MF§ = false;
         this.alphaTweenIn = new Tween(this,"alpha",Strong.easeOut,0,0.25,20,false);
      }
      
      public function hide() : void
      {
         this.alphaTweenOut = new Tween(this,"alpha",Strong.easeOut,0.25,0,20,false);
         this.alphaTweenOut.addEventListener(TweenEvent.MOTION_FINISH,this.alphaFinish,false,0,true);
      }
      
      public function start() : void
      {
         this.§_-MF§ = false;
         this.alphaTweenOut = new Tween(this,"alpha",Strong.easeOut,0.8,0,30,false);
         this.alphaTweenOut.addEventListener(TweenEvent.MOTION_FINISH,this.alphaFinish,false,0,true);
      }
      
      protected function alphaFinish(param1:TweenEvent) : *
      {
         this.destroyThis();
      }
      
      private function destroyThis() : void
      {
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
