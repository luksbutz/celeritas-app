package middleware

import (
	"github.com/luksbutz/celeritas"
	"myapp/data"
)

type Middleware struct {
	App    *celeritas.Celeritas
	Models data.Models
}
