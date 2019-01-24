package
{
   import §_-CI§.§_-EI§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.trace;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class §_-Th§ extends MovieClip
   {
       
      
      public function §_-Th§()
      {
         super();
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(0);
         _loc1_.graphics.drawRect(0,0,700,600);
         _loc1_.graphics.endFill();
         this.addChild(_loc1_);
         var _loc2_:TextField = new TextField();
         addChild(_loc2_);
         _loc2_.text = String(§_-EI§.§_-7r§(863,827));
         _loc2_.width = 300;
         _loc2_.x = 200;
         _loc2_.y = 180;
         _loc2_.multiline = true;
         _loc2_.selectable = false;
         _loc2_.border = true;
         _loc2_.autoSize = TextFieldAutoSize.CENTER;
         var _loc3_:TextFormat = new TextFormat();
         _loc3_.color = 16777215;
         _loc3_.size = 21;
         _loc3_.align = "center";
         _loc3_.italic = true;
         _loc2_.setTextFormat(_loc3_);
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      public function clickEvents(param1:MouseEvent) : void
      {
         var _loc2_:String = §_-EI§.§_-7r§(862,826);
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         trace(_loc3_,"_blank");
      }
   }
}
