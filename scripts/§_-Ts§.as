package
{
   import flash.geom.Point;
   
   public class §_-Ts§
   {
       
      
      public var position:Point;
      
      public var f:Number;
      
      public var g:Number;
      
      public var h:Number;
      
      public var §_-BR§:Boolean;
      
      public var parentNode:§_-Ts§;
      
      public var cost:Number;
      
      public var §_-Be§:Object;
      
      public function §_-Ts§(param1:Point, param2:Boolean = true)
      {
         super();
         this.position = param1;
         this.§_-BR§ = param2;
         this.cost = §_-7§.§_-23§;
      }
      
      public function getNodeRealPosition() : Point
      {
         return new Point(6.25 + 12.5 * this.position.x,6.25 + 12.5 * this.position.y);
      }
   }
}
