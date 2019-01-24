package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class §_-BH§ extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public var txtDescription:TextField;
      
      public var txtTitle:TextField;
      
      public function §_-BH§(param1:Point, param2:Boolean, param3:String, param4:String, param5:String)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         if(param2)
         {
            this.gotoAndStop(1);
         }
         else
         {
            this.gotoAndStop(2);
         }
         this.icon.gotoAndStop(param3);
         this.txtTitle.text = param4.toUpperCase();
         this.txtDescription.text = param5;
         if(TextField(this.txtDescription).numLines == 1)
         {
            this.txtTitle.y = this.txtTitle.y + 5;
            this.txtDescription.y = this.txtDescription.y + 5;
         }
      }
      
      public function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
   }
}
