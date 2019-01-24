package
{
   import com.adobe.crypto.SHA256;
   import com.reintroducing.sound.SoundManager;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class MenuCredits extends MovieClip
   {
       
      
      public var butBack:MovieClip;
      
      protected var cRoot:Defense;
      
      public function MenuCredits(param1:Defense)
      {
         super();
         this.cRoot = param1;
         this.butBack.gotoAndStop("idle");
         this.butBack.addEventListener(MouseEvent.CLICK,this.§_-QO§,false,0,true);
         this.butBack.addEventListener(MouseEvent.ROLL_OVER,this.§else §,false,0,true);
         this.butBack.addEventListener(MouseEvent.ROLL_OUT,this.§_-CE§,false,0,true);
         this.butBack.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Ox§,false,0,true);
         this.butBack.addEventListener(MouseEvent.MOUSE_UP,this.§_-JT§,false,0,true);
         var _loc2_:BitmapData = new §_-Bj§(700,600);
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginBitmapFill(_loc2_);
         _loc3_.graphics.drawRect(0,0,_loc2_.width,_loc2_.height);
         _loc3_.graphics.endFill();
         this.addChildAt(_loc3_,0);
      }
      
      public function endCredits() : void
      {
         this.cRoot.showMainMenu();
         this.destroyThis();
      }
      
      protected function §_-QO§(param1:MouseEvent) : void
      {
         this.butBack.removeEventListener(MouseEvent.CLICK,this.§_-QO§);
         SoundManager.getInstance().stopSound("gui_button_common");
         SoundManager.getInstance().playSound("gui_button_common",1,0,0);
         this.cRoot.showTransition(null,null,null,null,null,this);
      }
      
      protected function §else §(param1:MouseEvent) : void
      {
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         this.butBack.buttonMode = true;
         this.butBack.mouseChildren = false;
         this.butBack.useHandCursor = true;
         this.butBack.gotoAndStop("over");
      }
      
      protected function §_-CE§(param1:MouseEvent) : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         this.butBack.useHandCursor = false;
         this.butBack.gotoAndStop("idle");
      }
      
      protected function §_-Ox§(param1:MouseEvent) : void
      {
         this.butBack.gotoAndStop("press");
      }
      
      protected function §_-JT§(param1:MouseEvent) : void
      {
         this.butBack.gotoAndStop("idle");
      }
      
      private function §_-9m§(param1:BitmapData) : uint
      {
         var _loc2_:Rectangle = new Rectangle(0,0,param1.width,param1.height);
         var _loc3_:ByteArray = param1.getPixels(_loc2_);
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc4_ = _loc4_ + _loc3_[_loc5_];
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function as3_core(param1:BitmapData) : String
      {
         var _loc2_:Rectangle = new Rectangle(0,0,param1.width,param1.height);
         var _loc3_:ByteArray = param1.getPixels(_loc2_);
         return SHA256.hashBytes(_loc3_);
      }
      
      protected function destroyThis() : void
      {
         this.cRoot = null;
         this.butBack.removeEventListener(MouseEvent.ROLL_OVER,this.§else §);
         this.butBack.removeEventListener(MouseEvent.ROLL_OUT,this.§_-CE§);
         this.butBack.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Ox§);
         this.butBack.removeEventListener(MouseEvent.MOUSE_UP,this.§_-JT§);
         this.removeChild(this.butBack);
         this.parent.removeChild(this);
      }
   }
}
