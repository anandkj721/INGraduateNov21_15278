using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ApiDbProductContext;
using ecom.Models;

namespace ecom.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductpagesController : ControllerBase
    {
        private readonly dev_apidbProductContext _context;

        public ProductpagesController(dev_apidbProductContext context)
        {
            _context = context;
        }

        // GET: api/Productpages
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Productpage>>> GetProductpages()
        {
            return await _context.Productpages.ToListAsync();
        }

        // GET: api/Productpages/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Productpage>> GetProductpage(int id)
        {
            var productpage = await _context.Productpages.FindAsync(id);

            if (productpage == null)
            {
                return NotFound();
            }

            return productpage;
        }

        // PUT: api/Productpages/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProductpage(int id, Productpage productpage)
        {
            if (id != productpage.Id)
            {
                return BadRequest();
            }

            _context.Entry(productpage).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductpageExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Productpages
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.

        //******
        [HttpPost]
        public async Task<ActionResult<Productpage>> PostProductpage(Productpage productpage)
        {
            _context.Productpages.Add(productpage);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetProductpage", new { id = productpage.Id }, productpage);
        }
        //***********
      
        // DELETE: api/Productpages/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Productpage>> DeleteProductpage(int id)
        {
            var productpage = await _context.Productpages.FindAsync(id);
            if (productpage == null)
            {
                return NotFound();
            }

            _context.Productpages.Remove(productpage);
            await _context.SaveChangesAsync();

            return productpage;
        }

        private bool ProductpageExists(int id)
        {
            return _context.Productpages.Any(e => e.Id == id);
        }
    }
}
