# For advanced users:
# You can put some quick verification tests here, any method
# that starts with the `test_` will be run when you save this file.

# Here is an example test and game

# To run the test: ./dragonruby mygame --eval app/tests.rb --no-tick

TEST_FRUIT_DATAS = [
  {
    fruits: {
    },
    possible_sort_fruits: [[:none]]
  }, {
    fruits: {
      apples: {parent: :oranges, v1: 1, v2: 2},
      oranges: {parent: :bananas, v1: 1, v2: 2},
      bananas: {parent: :none, v1: 1, v2: 2},
      lemons: {parent: :bananas, v1: 1, v2: 2},
    },
    possible_sort_fruits: [
      [:none, :bananas, :oranges, :lemons, :apples],
      [:none, :bananas, :lemons, :oranges, :apples]
    ]
  }, {
    # This test case fails, because the sorting depends on order and :bananas will come before :pears
    fruits: {
      apples: {parent: :oranges, v1: 1, v2: 2},
      oranges: {parent: :bananas, v1: 1, v2: 2},
      bananas: {parent: :none, v1: 1, v2: 2},
      lemons: {parent: :bananas, v1: 1, v2: 2},
      pears: {parent: :none, v1: 1, v2: 2},
    },
    possible_sort_fruits: [
      [:none, :pears, :bananas, :oranges, :lemons, :apples],
      [:none, :bananas, :pears, :oranges, :lemons, :apples]
    ]
  }, {
    # This test case fails on purpose to show the failure message example (there is no :blah)
    fruits: {
      apples: {parent: :oranges, v1: 1, v2: 2},
      oranges: {parent: :bananas, v1: 1, v2: 2},
      bananas: {parent: :none, v1: 1, v2: 2},
      lemons: {parent: :bananas, v1: 1, v2: 2},
      pears: {parent: :none, v1: 1, v2: 2},
    },
    possible_sort_fruits: [
      [:blah, :pears, :bananas, :oranges, :lemons, :apples],
      [:blah, :bananas, :pears, :oranges, :lemons, :apples]
    ]
  }
]

def test_sort_fruits(_args, assert)
  TEST_FRUIT_DATAS.each.with_index do |data, i|
    result = sort_fruits(data[:fruits])
    assert.true!(
      data[:possible_sort_fruits].any? { |pos| pos == result },
      "sort_fruits test case #{i} failed:\n#{result}\nnot found in\n#{data[:possible_sort_fruits]}"
    )
  end
end

puts "running tests"
$gtk.reset rand(1_000_000)
# $gtk.log_level = :off
$gtk.tests.start
