package handlers

import (
	"myapp/data"
	"net/http"
	"time"

	"github.com/luksbutz/celeritas"
)

// Handlers is the type for handlers, and gives access to Celeritas and models
type Handlers struct {
	App    *celeritas.Celeritas
	Models *data.Models
}

// Home is the handler to render the home page
func (h *Handlers) Home(w http.ResponseWriter, r *http.Request) {
	defer h.App.LoadTime(time.Now())
	err := h.App.Render.Page(w, r, "home", nil, nil)
	if err != nil {
		h.App.ErrorLog.Println("error rendering:", err)
	}
}
