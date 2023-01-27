
# [1,3,0,4,2,0]
def move_zeros(nums):
    res, zeros = [], 0
    for i in nums:
        if i:
            res.append(i)
        else:
            zeros += 1
    res += [0] * zeros
    return res


def m(nums):
    l = 0
    for r in range(len(nums)):
        if nums[r]:
            nums[l], nums[r] = nums[r], nums[l]
            l += 1


mylist = [1, 3, 0, 4, 2, 0]
print(move_zeros(mylist))
