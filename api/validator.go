package api

import (
	"github.com/go-playground/validator/v10"
	"github.com/jczmr/go-simple-bank/util"
)

var validCurrency validator.Func = func(fl validator.FieldLevel) bool {
	if currency, ok := fl.Field().Interface().(string); ok {
		return util.ItsSupportedCurrency(currency)
	}
	return false
}
