# For advanced users:
# You can put some quick verification tests here, any method
# that starts with the `test_` will be run when you save this file.

# Here is an example test and game

# To run the test: ./dragonruby mygame --eval app/tests.rb --no-tick

TEST_FRUIT_DATAS = [{
  fruits: {
    apples: {parent: :oranges, v1: 1, v2: 2},
    oranges: {parent: :bananas, v1: 1, v2: 2},
    bananas: {parent: :none, v1: 1, v2: 2},
    lemons: {parent: :bananas, v1: 1, v2: 2},
  },
  expected_sort_fruits: [:none, :bananas, :oranges, :lemons, :apples]
}]

def test_sort_fruits(_args, assert)
  TEST_FRUIT_DATAS.each.with_index do |data, i|
    assert.equal!(sort_fruits(data[:fruits]), data[:expected_sort_fruits], "sort_fruits test case #{i} failed")
  end
end

puts "running tests"
$gtk.reset rand(1_000_000)
# $gtk.log_level = :off
$gtk.tests.start
