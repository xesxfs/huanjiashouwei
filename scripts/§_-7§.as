package
{
   import flash.geom.Point;
   
   public class §_-7§
   {
      
      public static const §true §:int = 0;
      
      public static const §switch§:int = 1;
      
      public static const §_-3p§:int = 2;
      
      public static const §_-C0§:Number = 1;
      
      public static const §_-LH§:Number = 1.414;
      
      public static const §_-23§:Number = 1;
      
      public static const §true§:Number = 1;
       
      
      public var open:Array;
      
      public var closed:Array;
      
      public var path:Array;
      
      public var grid:AStarGrid;
      
      public var §_-Rx§:Number;
      
      public var §_-J0§:Number;
      
      public var §_-Ee§:int;
      
      public function §_-7§(param1:AStarGrid)
      {
         super();
         this.grid = param1;
         this.§_-J0§ = §_-LH§;
         this.§_-Rx§ = §_-C0§;
         this.§_-Ee§ = §true §;
         this.open = [];
         this.closed = [];
         this.path = [];
      }
      
      public function findPath() : Boolean
      {
         if(!this.grid.startNode || !this.grid.endNode)
         {
            return false;
         }
         if(!this.grid.startNode.§_-BR§ || !this.grid.endNode.§_-BR§)
         {
            return false;
         }
         this.open = [];
         this.closed = [];
         this.path = [];
         this.grid.startNode.g = 0;
         this.grid.startNode.h = this.getHeruistic(this.grid.startNode);
         this.grid.startNode.f = this.grid.startNode.g + this.grid.startNode.h;
         return this.§_-KW§();
      }
      
      public function §_-KW§() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:§_-Ts§ = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc1_:§_-Ts§ = this.grid.startNode;
         while(_loc1_ != this.grid.endNode)
         {
            _loc2_ = Math.max(0,_loc1_.position.x - 1);
            _loc3_ = Math.min(this.grid.§_-Bs§ - 1,_loc1_.position.x + 1);
            _loc4_ = Math.max(0,_loc1_.position.y - 1);
            _loc5_ = Math.min(this.grid.§_-Dx§ - 1,_loc1_.position.y + 1);
            _loc6_ = _loc2_;
            while(_loc6_ <= _loc3_)
            {
               _loc7_ = _loc4_;
               for(; _loc7_ <= _loc5_; _loc7_++)
               {
                  _loc8_ = this.grid.getNodeAtPosition(new Point(_loc6_,_loc7_));
                  if(_loc8_ != _loc1_)
                  {
                     if(_loc8_.§_-BR§)
                     {
                        if(§true§ == 0)
                        {
                           if(_loc8_.position.x != _loc1_.position.x && _loc8_.position.y != _loc1_.position.y)
                           {
                           }
                           continue;
                        }
                        _loc9_ = this.§_-Rx§;
                        if(!(_loc1_.position.x == _loc8_.position.x || _loc1_.position.y == _loc8_.position.y))
                        {
                           _loc9_ = this.§_-J0§;
                        }
                        _loc10_ = _loc1_.g + _loc9_ * _loc8_.cost;
                        _loc11_ = this.getHeruistic(_loc8_);
                        _loc12_ = _loc10_ + _loc11_;
                        if(this.isOpen(_loc8_) || this.isClosed(_loc8_))
                        {
                           if(_loc8_.f > _loc12_)
                           {
                              _loc8_.f = _loc12_;
                              _loc8_.g = _loc10_;
                              _loc8_.h = _loc11_;
                              _loc8_.parentNode = _loc1_;
                              continue;
                           }
                        }
                        else
                        {
                           _loc8_.f = _loc12_;
                           _loc8_.g = _loc10_;
                           _loc8_.h = _loc11_;
                           _loc8_.parentNode = _loc1_;
                           this.open.push(_loc8_);
                        }
                        continue;
                     }
                     continue;
                  }
               }
               _loc6_++;
            }
            this.closed.push(_loc1_);
            if(this.open.length == 0)
            {
               return false;
            }
            this.open.sortOn("f",Array.NUMERIC);
            _loc1_ = this.open[0];
            this.open.splice(0,1);
         }
         this.§_-0A§();
         return true;
      }
      
      public function §_-0A§() : Array
      {
         this.path = [];
         var _loc1_:§_-Ts§ = this.grid.endNode;
         while(_loc1_ != this.grid.startNode)
         {
            this.path.push(_loc1_);
            _loc1_ = _loc1_.parentNode;
         }
         return this.path;
      }
      
      public function getHeruistic(param1:§_-Ts§) : Number
      {
         switch(this.§_-Ee§)
         {
            case §_-3p§:
               return this.§_-B0§(param1);
            case §true §:
               return this.§_-Hm§(param1);
            case §switch§:
               return this.§_-Pj§(param1);
            default:
               return this.§_-B0§(param1);
         }
      }
      
      public function §_-Hm§(param1:§_-Ts§) : Number
      {
         return Math.abs(param1.position.x - this.grid.endNode.position.x) * this.§_-Rx§ + Math.abs(param1.position.y - this.grid.endNode.position.y) * this.§_-Rx§;
      }
      
      public function §_-Pj§(param1:§_-Ts§) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         _loc2_ = param1.position.x - this.grid.endNode.position.x;
         _loc3_ = param1.position.y - this.grid.endNode.position.y;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      }
      
      public function §_-B0§(param1:§_-Ts§) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         _loc2_ = Math.abs(param1.position.x - this.grid.endNode.position.x);
         _loc3_ = Math.abs(param1.position.y - this.grid.endNode.position.y);
         _loc4_ = Math.min(_loc2_,_loc3_);
         _loc5_ = _loc2_ + _loc3_;
         return this.§_-J0§ * _loc4_ + this.§_-Rx§ * (_loc5_ - 2 * _loc4_);
      }
      
      public function isOpen(param1:§_-Ts§) : Boolean
      {
         var _loc2_:§_-Ts§ = null;
         for each(_loc2_ in this.open)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function isClosed(param1:§_-Ts§) : Boolean
      {
         var _loc2_:§_-Ts§ = null;
         for each(_loc2_ in this.closed)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
   }
}
