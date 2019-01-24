package com.dougmccune
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class HitTester
   {
       
      
      public function HitTester()
      {
         super();
      }
      
      public static function realHitTest(param1:DisplayObject, param2:Point, param3:Level) : Boolean
      {
         var _loc4_:BitmapData = null;
         var _loc5_:Matrix = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Boolean = false;
         var _loc9_:Bitmap = null;
         if(param1 is BitmapData)
         {
            return (param1 as BitmapData).hitTest(new Point(0,0),0,param1.globalToLocal(param2));
         }
         if(!param1.hitTestPoint(param2.x,param2.y,true))
         {
            return false;
         }
         _loc4_ = new BitmapData(param1.width,param1.height,true,0);
         _loc5_ = new Matrix();
         if(Enemy(param1).scaleX == -1)
         {
            _loc5_.scale(-1,1);
         }
         _loc5_.translate(Enemy(param1).§_-NA§,Enemy(param1).§_-C-§);
         _loc4_.draw(param1,_loc5_);
         param2.x = param2.x + Enemy(param1).§_-NA§;
         param2.y = param2.y + Enemy(param1).§_-C-§;
         _loc6_ = param1.globalToLocal(param2).x;
         _loc7_ = param1.globalToLocal(param2).y;
         if(Enemy(param1).scaleX == -1)
         {
            _loc6_ = _loc6_ * -1;
         }
         _loc8_ = _loc4_.hitTest(new Point(0,0),0,new Point(_loc6_,_loc7_));
         _loc4_.dispose();
         _loc9_ = new Bitmap(_loc4_);
         return _loc8_;
      }
   }
}
