var makeChange = function(target, coins) {
  var coins = coins.sort(function(a,b){return(a - b);}).reverse();
  console.log(coins);
  var best_change = null;

  if (target == 0) {
    return [];
  } else if (coins.length == 0) {
    return null;
  } else {
    for(var i = 0; i < coins.length; i++){
      if(target < coins[i]) {
        continue;
      } else {
        var remainder = target - coins[i];
        var best_remainder = makeChange(remainder, coins.slice(i, coins.length));
          if (best_remainder == null) {
            continue;
          }
        var this_change = best_remainder.concat(coins[i]);

        if (best_change == null || this_change.count < best_change.count) {
          best_change = this_change;
        }
      }
    }
  }
  return best_change;
}