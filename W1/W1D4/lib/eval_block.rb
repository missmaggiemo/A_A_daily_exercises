def eval_block(*args, &block)
  raise "NO BLOCK GIVEN!" unless block_given?

  block.call(*args)

end

eval_block(1,2,3,4) {|args| p args}
# with no * ("splat"), only the 1st arg of args is used in the block because we've only asked for one element
eval_block(1,2) {|arg1, arg2| p arg1; p arg2}
# see? with two inputs, two things get p'd!
eval_block(1,2) {|arg1, arg2, arg3| p arg1; p arg2; p arg3}
# with three inputs, the third element got ignored

eval_block(1,2,3,4) {|*args| p args}
# add the * again and evrything goes back into an array!

# think of an accordion!