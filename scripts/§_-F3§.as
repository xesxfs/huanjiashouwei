package
{
   import flash.geom.Point;
   
   public class §_-F3§ extends §_-Mk§
   {
       
      
      public function §_-F3§(param1:Point)
      {
         super(param1,false);
         var _loc2_:Number = Math.random() + 0.7;
         if(_loc2_ >= 1)
         {
            _loc2_ = 1;
         }
         this.scaleY = _loc2_;
         if(Math.random() > 0.5)
         {
            this.scaleX = _loc2_;
         }
         else
         {
            this.scaleX = _loc2_ * -1;
         }
      }
   }
}
