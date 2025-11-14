package util

import (
	"math/rand"
	"time"
)

func init() {
	rand.NewSource(time.Second.Microseconds())
}

// RandomInt returns a random integer between min and max inclusive.
func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}

// RandomString returns a random string of length n.
func RandomString(n int) string {
	const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	result := make([]byte, n)
	for i := range result {
		result[i] = letters[rand.Intn(len(letters))]
	}
	return string(result)
}

// RandomOwner returns a random owner name.
func RandomOwner() string {
	return RandomString(6)
}

// RandomMoney returns a random amount of money.
func RandomMoney() int64 {
	return RandomInt(0, 1000)
}

// RandomCurrency returns a random currency code.
func RandomCurrency() string {
	currencies := []string{"USD", "EUR", "CAD"}
	n := len(currencies)
	return currencies[rand.Intn(n)]
}
