package
{
   import flash.geom.Point;
   
   public class AStarGrid
   {
       
      
      public var startNode:§_-Ts§;
      
      public var endNode:§_-Ts§;
      
      public var nodes:Array;
      
      public var §_-Bs§:int;
      
      public var §_-Dx§:int;
      
      public function AStarGrid(param1:int, param2:int, param3:Array = null)
      {
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:§_-Ts§ = null;
         super();
         if(param3 == null)
         {
            this.nodes = [];
            this.§_-Bs§ = param1;
            this.§_-Dx§ = param2;
            _loc4_ = 0;
            while(_loc4_ < this.§_-Bs§)
            {
               _loc5_ = [];
               _loc6_ = 0;
               while(_loc6_ < this.§_-Dx§)
               {
                  _loc7_ = new §_-Ts§(new Point(_loc4_,_loc6_));
                  _loc5_.push(_loc7_);
                  _loc6_++;
               }
               this.nodes.push(_loc5_);
               _loc4_++;
            }
         }
         else
         {
            this.nodes = param3;
            this.§_-Bs§ = param3.length;
            this.§_-Dx§ = param3[0].length;
         }
      }
      
      public function getNodeAtPosition(param1:Point) : §_-Ts§
      {
         if(param1.x < 0 || param1.y < 0)
         {
            return null;
         }
         if(this.nodes.length <= param1.x)
         {
            return null;
         }
         if(this.nodes[param1.x].length <= param1.y)
         {
            return null;
         }
         return this.nodes[param1.x][param1.y];
      }
      
      public function setStartNodePosition(param1:Point) : void
      {
         this.startNode = this.getNodeAtPosition(param1);
      }
      
      public function setEndNodePosition(param1:Point) : void
      {
         this.endNode = this.getNodeAtPosition(param1);
      }
   }
}
